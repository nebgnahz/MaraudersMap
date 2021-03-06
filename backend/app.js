var http = require('http')
, app = require('http').createServer(handler)
, io = require('socket.io').listen(app)
, url = require('url')
, fs = require('fs')
, querystring = require('querystring')
, util = require('util');


app.listen(8888);

// sMAP interface configuration
var data = 'uuid = "d8401a6e-2313-11e2-99e6-b8f6b119696f"'

var options = {
    host: 'ar1.openbms.org',
    port: 8079,
    path: '/republish',
    method: 'POST'
};

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

// this is the RESTful server part
function handler (req, res) {
    // your normal server code
    console.log(req.url);
    var path = url.parse(req.url).pathname;
    var query = querystring.parse(url.parse(req.url).query);
    switch (path){
    // by default, return index.html file
    case '/':
	fs.readFile(__dirname + '/index.html',
		    function (err, data) {
			if (err) {
			    res.writeHead(500);
			    return res.end('Error loading index.html');
			}
			res.writeHead(200);
			res.end(data);
		    });
	break;
    case '/favicon.ico':
	fs.stat(__dirname+path, function(error, stat) {
	    var rs;
	    res.writeHead(200, {
		'Content-Type' : 'image/x-icon',
		'Content-Length' : stat.size
	    });
	    rs = fs.createReadStream(__dirname + path);
	    // pump the file to the response
	    util.pump(rs, res, function(err) {
		if(err) {
		    throw err;
		}
	    });
	});
	break;
    default:
	if (/\.(js|html|swf)$/.test(path)){
	    try {
		var swf = path.substr(-4) === '.swf';
		res.writeHead(200, {'Content-Type': swf ? 'application/x-shockwave-flash' : ('text/' + (path.substr(-3) === '.js' ? 'javascript' : 'html'))});
		res.write(fs.readFileSync(__dirname + path, swf ? 'binary' : 'utf8'), swf ? 'binary' : 'utf8');
		res.end();
	    } catch(e){ 
		res.writeHead(500);
		return res.end('Error loading index.html');
	    }               
	    break;
	}
	else if (/\.(css)$/.test(path)){
	    res.writeHead(200, {'Content-Type': 'text/css'});
	    res.write(fs.readFileSync(__dirname + path, 'utf8'));
	    res.end();
	    break;
	}
	else if (/\.(gif)$/.test(path)){
	    fs.stat(__dirname+path, function(error, stat) {
		var rs;
		// We specify the content-type and the content-length headers
		// important!
		res.writeHead(200, {
		    'Content-Type' : 'image/gif',
		    'Content-Length' : stat.size
		});
		rs = fs.createReadStream(__dirname + path);
		// pump the file to the response
		util.pump(rs, res, function(err) {
		    if(err) {
			throw err;
		    }
		});
	    });
	    break;
	}
	else if (/\.(png)$/.test(path)){
	    fs.stat(__dirname+path, function(error, stat) {
		var rs;
		// We specify the content-type and the content-length headers
		// important!
		res.writeHead(200, {
		    'Content-Type' : 'image/png',
		    'Content-Length' : stat.size
		});
		rs = fs.createReadStream(__dirname + path);
		// pump the file to the response
		util.pump(rs, res, function(err) {
		    if(err) {
			throw err;
		    }
		});
	    });
	    break;
	}
	res.writeHead(500);
	return res.end('Error loading index.html');
	break;
    }
}
