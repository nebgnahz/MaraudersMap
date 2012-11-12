#Backend server
We are using Node.js for the backend server for
- super simple
- providing us socket.io for quasi real-time communication

## Set up
Refer to Node.js tutorial for basic understanding of node.
	
	npm install socket.io

To run this application:

	node app.js
which will by default open port 8888 for listening. Use a browser to visit http://localhost:8888 for socket.io connection.

The server will respond with the _index.html_ file.