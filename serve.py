import os, sys
os.chdir(os.path.join(os.path.dirname(__file__), "www"))
sys.argv = [""]
import http.server, socketserver
PORT = 3000
with socketserver.TCPServer(("", PORT), http.server.SimpleHTTPRequestHandler) as httpd:
    print(f"Serving on http://localhost:{PORT}")
    httpd.serve_forever()
