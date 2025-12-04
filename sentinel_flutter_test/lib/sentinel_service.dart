import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

/// Service that encapsulates the Sentinel Hub Process API call.
class SentinelService {
  static const String _processUrl =
      'https://services.sentinel-hub.com/api/v1/process';

  /// Fetches a PNG image from Sentinel Hub and returns its raw bytes.
  ///
  /// Returns null if the call fails. Errors are logged to the console.
  Future<Uint8List?> fetchSentinelImage() async {
    // Replace the token with a valid OAuth token generated in Sentinel Hub.
    const String bearerToken = 'YOUR_TOKEN_HERE';

    // Mandatory headers for the Process API request.
    final Map<String, String> headers = {
      'Authorization': 'Bearer $bearerToken',
      'Content-Type': 'application/json',
      'Accept': 'image/png',
    };

    // Example Evalscript that returns an RGB composite from Sentinel-2 L2A data.
    const String evalscript = r'''
//VERSION=3
function setup() {
  return {
    input: [{
      bands: ["B04", "B03", "B02"],
      units: "REFLECTANCE"
    }],
    output: {
      bands: 3,
      sampleType: "AUTO"
    }
  };
}

function evaluatePixel(sample) {
  return [sample.B04 * 2.5, sample.B03 * 2.5, sample.B02 * 2.5];
}
''';

    // Payload conforms to https://docs.sentinel-hub.com/api/latest/api/process/
    final Map<String, dynamic> requestBody = {
      'input': {
        'bounds': {
          'bbox': [
            13.822174072265625,
            45.85080395917834,
            14.55963134765625,
            46.29191774991382
          ],
        },
        'data': [
          {
            'type': 'sentinel-2-l2a',
            'dataFilter': {
              'timeRange': {
                'from': '2023-06-01T00:00:00Z',
                'to': '2023-06-30T23:59:59Z'
              },
              'maxCloudCoverage': 10
            }
          }
        ],
      },
      'output': {
        'width': 512,
        'height': 512,
        'responses': [
          {
            'identifier': 'default',
            'format': {'type': 'image/png'}
          }
        ]
      },
      'evalscript': evalscript,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(_processUrl),
        headers: headers,
        body: jsonEncode(requestBody),
      );

      // Always log the status so we can inspect failures quickly.
      print('Process API status: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('Image bytes received: ${response.bodyBytes.lengthInBytes}');
        return response.bodyBytes;
      } else {
        // Print the full response for debugging.
        print('Process API error: ${response.body}');
      }
    } catch (error) {
      print('Unexpected exception while calling Process API: $error');
    }

    return null;
  }
}
