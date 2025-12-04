import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'sentinel_service.dart';

void main() {
  runApp(const SentinelApp());
}

/// Root widget that wires up the Sentinel Hub demo.
class SentinelApp extends StatelessWidget {
  const SentinelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentinel Hub Process API Test',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const SentinelHomePage(),
    );
  }
}

class SentinelHomePage extends StatefulWidget {
  const SentinelHomePage({super.key});

  @override
  State<SentinelHomePage> createState() => _SentinelHomePageState();
}

class _SentinelHomePageState extends State<SentinelHomePage> {
  final SentinelService _service = SentinelService();

  Uint8List? _imageBytes;
  bool _isLoading = false;
  String? _error;

  /// Calls the Process API and updates the UI based on the response.
  Future<void> _loadImage() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final Uint8List? bytes = await _service.fetchSentinelImage();

    if (!mounted) return;

    setState(() {
      _isLoading = false;
      if (bytes != null) {
        _imageBytes = bytes;
      } else {
        _error = 'Failed to fetch image. See logs for details.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sentinel Hub Process API Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _loadImage,
              icon: const Icon(Icons.satellite_alt_outlined),
              label: Text(_isLoading ? 'Loading...' : 'Fetch Sentinel Image'),
            ),
            const SizedBox(height: 24),
            if (_error != null)
              Text(
                _error!,
                style: const TextStyle(color: Colors.red),
              ),
            if (_imageBytes != null)
              Expanded(
                child: Center(
                  // Image.memory renders the in-memory PNG bytes returned by the API.
                  child: Image.memory(
                    _imageBytes!,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            else if (_isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else
              const Expanded(
                child: Center(
                  child: Text('Tap the button to download an image.'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
