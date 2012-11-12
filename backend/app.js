var http = require('http')
, app = require('http').createServer(handler)
, io = require('socket.io').listen(app)
, fs = require('fs');

app.listen(8888);

// sMAP interface configuration
var data = 'uuid = "90f10646-11e6-5bae-b2b2-3a173dbbcd0a"'

var options = {
    host: 'ar1.openbms.org',
    port: 8079,
    path: '/republish',
    method: 'POST'
};

// function that handles incoming HTTP request
function handler (req, res) {
  fs.readFile(__dirname + '/index.html',
  function (err, data) {
    if (err) {
      res.writeHead(500);
      return res.end('Error loading index.html');
    }
    res.writeHead(200);
    res.end(data);
  });
}

// when new connection established, start query
io.sockets.on('connection', function (socket) {
    socket.emit('news', { hello: 'world' });
    socket.on('my other event', function (data) {
	console.log(data);
    });

    var req = http.request(options, function(res) {
	res.setEncoding('utf8');
	res.on('data', function (chunk) {
            console.log("Got response: " + chunk);
	    socket.emit('newData', chunk);
	});
    });
    req.write(data);
    console.log("waiting for sMAP responses");
    req.end();
});
