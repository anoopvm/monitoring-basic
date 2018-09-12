#!/usr/bin/env python

from BaseHTTPServer import BaseHTTPRequestHandler
from BaseHTTPServer import HTTPServer
import threading
import os

def threadWorker(x,data):
 try:
    print (data)
    event_status = data["alerts"][0]["status"]
	print (event_status)
    if event_status == "firing":
   	    print ("Firing alert to switch over")
        os.system("sh /home/ubuntu/monitoring/epcCreate/switch-over-service.sh")
        print ("Finished calling the switch-over-service.sh")
    else:
   	    print ("Resolved alert to switch back")
        os.system("sh /home/ubuntu/monitoring/epcCreate/switch-back-service.sh")
        print ("Finished calling the switch-back-service.sh")
 except Exception as e:
    error_string = str(e)
    print (error_string)


class AlarmHandler(BaseHTTPRequestHandler):
    def do_POST(self):
      try:
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
    print ("server started")
    httpd.serve_forever()
