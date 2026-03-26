const http = require("http");

const server = http.createServer((req, res) => {
  res.end("Hello from Multi-Stage Demo!");      
});

server.listen(3000);
