#!/usr/bin/env python

from BaseHTTPServer import BaseHTTPRequestHandler
from BaseHTTPServer import HTTPServer
import threading
import os
import json

def threadWorker(x,data):
 try:
    data = json.loads(data)
    event_status = data["alerts"][0]["status"]
    name = data["alerts"][0]["labels"]["alertname"]
    print ("Alertname : " + name + " Status : " + event_status)
    if event_status == "firing":
        if name == "OnfNetworkUsageHigh2":
            print ("Resolved alert to switch back")
            os.system("sh /home/ubuntu/monitoring/epcCreate/switch-back-service.sh")
            print ("Finished calling the switch-back-service.sh")
        else:
            print ("Firing alert to switch over")
            os.system("sh /home/ubuntu/monitoring/epcCreate/switch-over-service.sh")
            print ("Finished calling the switch-over-service.sh")
    else:
        print ("Not doing anything as the alert is resolved")
 except Exception as e:
    error_string = str(e)
    print (error_string)


class AlarmHandler(BaseHTTPRequestHandler):
    def do_POST(self):
      try:
        print ("Received alert from Alertmanager")
        self.send_response(200)
        self.end_headers()
        data = self.rfile.read(int(self.headers['Content-Length']))
        i = 0
        t = threading.Thread(target=threadWorker,args=(i,data,))
        t.start()
        return

      except Exception as e:
        error_string = str(e)
        return

if __name__ == '__main__':
    httpd = HTTPServer(('', 9333), AlarmHandler)
    print ("Server starting")
    httpd.serve_forever()
