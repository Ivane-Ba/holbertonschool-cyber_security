#!/bin/bash
decoding=$(echo $1 | sed -e "s/{xor}//g" | base64 --decode)
b64_clean=$(echo "$decoding" | tr -d \\n | od -An -tx1 | tr -dc '[[:alnum:]]')
size=${#b64_clean}
for (( i=0; i<size; i+=2 )); do
	hexa_xor_underscore=$((16#${b64_clean:i:2} ^ 95))
	result+=$(printf '\\x%x' $hexa_xor_underscore)
done
echo -e $result