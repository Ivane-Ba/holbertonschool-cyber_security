#!/bin/bash
python3 << EOF
import base64
import sys

hash_str = "$1"
encoded = hash_str.replace("{xor}", "")
decoded = base64.b64decode(encoded)
result = ''.join(chr(byte ^ 95) for byte in decoded)
print(result)
EOF
