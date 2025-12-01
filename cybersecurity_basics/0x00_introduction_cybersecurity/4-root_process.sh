#!/bin/bash
ps aux | grep "^$1" | grep -v grep | grep -vE '\s+0\s+0\s+'

