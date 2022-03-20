#!/bin/bash
set -e
echo "----- start servers -----"
cd integration
python3 server.py >server.log 2>&1 &
python3 ssl/server.py >server-ssl.log 2>&1 &
mitmdump -p 8888 --modify-header "/From-Proxy/Hello" >mitmdump.log 2>&1 &
