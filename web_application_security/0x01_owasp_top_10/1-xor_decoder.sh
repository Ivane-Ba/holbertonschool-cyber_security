#!/bin/bash
# Decode XOR WebSphere encoded password
# Usage: ./1-xor_decoder.sh {xor}ENCODED_VALUE

result=""

decoding=$(echo "$1" | sed 's/{xor}//g' | base64 --decode)
hex_stream=$(echo "$decoding" | tr -d '\n' | od -An -tx1 | tr -dc '[[:alnum:]]')
size=${#hex_stream}

for (( i=0; i<size; i+=2 ))
do
	byte=$((16#${hex_stream:i:2} ^ 95))
	result+=$(printf '\\x%x' "$byte")
done

echo -e "$result"
