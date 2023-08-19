#Much better than websocket, doesn't crash game :D

from http.server import BaseHTTPRequestHandler, HTTPServer
import win32api
import win32con
import random

class handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(404)
        self.send_header('Content-type','text/html')
        self.end_headers()

        message = "Wrong method buddy!"
        self.wfile.write(bytes(message, "utf8"))
    def do_POST(self):
        print(self.path)
        self.send_response(200)
        self.send_header('Content-type','text/html')
        self.end_headers()
        
        try:
            XandY = self.path.split("/")
            print("Got move mouse: "+ str(XandY[1]) +" "+ str(XandY[2]))
            X = float(XandY[1])
            Y = float(XandY[2])
            win32api.mouse_event(win32con.MOUSEEVENTF_MOVE, int(X),int(Y),0,0)
            message = "Got the request!"+ str(random.getrandbits(10))
            self.wfile.write(bytes(message, "utf8"))
        except:
            print("!!!SOMETHING WENT WRONG!!!")
            message = "!!!Something went wrong!!!"
            self.wfile.write(bytes(message, "utf8"))

with HTTPServer(('127.0.0.1', 6969), handler) as server:
    server.serve_forever()
