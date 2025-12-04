"""Python helper script to call the Sentinel Hub Process API.

Usage:
    pip install requests
    python sentinel_test.py
"""
from __future__ import annotations

import json
from pathlib import Path

import requests

PROCESS_URL = "https://services.sentinel-hub.com/api/v1/process"
OUTPUT_FILE = Path("output.png")


def build_payload() -> dict:
    """Constructs the same JSON body used in the Flutter example."""
    evalscript = """//VERSION=3\nfunction setup() {\n  return {\n    input: [{\n      bands: [\"B04\", \"B03\", \"B02\"],\n      units: \"REFLECTANCE\"\n    }],\n    output: {\n      bands: 3,\n      sampleType: \"AUTO\"\n    }\n  };\n}\n\nfunction evaluatePixel(sample) {\n  return [sample.B04 * 2.5, sample.B03 * 2.5, sample.B02 * 2.5];\n}\n"""

    return {
      "input": {
        "bounds": {
          "bbox": [
            13.822174072265625,
            45.85080395917834,
            14.55963134765625,
            46.29191774991382,
          ]
        },
        "data": [
          {
            "type": "sentinel-2-l2a",
            "dataFilter": {
              "timeRange": {
                "from": "2023-06-01T00:00:00Z",
                "to": "2023-06-30T23:59:59Z",
              },
              "maxCloudCoverage": 10,
            },
          }
        ],
      },
      "output": {
        "width": 512,
        "height": 512,
        "responses": [
          {"identifier": "default", "format": {"type": "image/png"}}
        ],
      },
      "evalscript": evalscript,
    }


def call_process_api(token: str) -> requests.Response:
    headers = {
      "Authorization": f"Bearer {token}",
      "Content-Type": "application/json",
      "Accept": "image/png",
    }

    payload = build_payload()
    print("Sending request to Sentinel Hub Process API ...")

    response = requests.post(
      PROCESS_URL,
      headers=headers,
      data=json.dumps(payload),
      timeout=90,
    )
    print(f"Status code: {response.status_code}")
    return response


def save_image(bytes_data: bytes) -> None:
    OUTPUT_FILE.write_bytes(bytes_data)
    print(f"Saved image to {OUTPUT_FILE.resolve()}")


def main() -> None:
    token = "YOUR_TOKEN_HERE"

    if token == "YOUR_TOKEN_HERE":
      print("WARNING: Replace YOUR_TOKEN_HERE with a valid Sentinel Hub token.")

    try:
      response = call_process_api(token)
    except requests.RequestException as exc:
      print(f"HTTP request failed: {exc}")
      return

    if response.status_code == 200:
      save_image(response.content)
    else:
      print("Process API returned an error:")
      print(response.text)


if __name__ == "__main__":
    main()
