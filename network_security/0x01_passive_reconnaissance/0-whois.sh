#!/bin/bash
whois "$1" | grep -Ei '^(Registrant|Admin|Tech)' > "$1.csv"
