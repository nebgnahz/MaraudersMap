#Backend server
We are using Node.js for the backend server for
- super simple
- providing us socket.io for quasi real-time communication

## Setting up
Refer to [Node.js](http://nodejs.org) and install **socket.io** by following command.
	
	npm install socket.io

To run this application:

	node app.js

which will by default open port 8888 for listening. Use a browser to visit <http://localhost:8888> for socket.io connection.

The server will respond with the **index.html** file.

## Data publishing
We can test the server by manual publishing data to sMAP archiver.(refer to [sMAP Documentation](http://code.google.com/p/smap-data/wiki/DataPublishing "DataPublishing - Manual data publishing to the archiver").)

Each person's location is a time series data, with the value indicating semantic location (use -1 means absence). It's in the _Readings_ part.

uuid can be generated by sMAP library (or we can just manually create one).

The data format is as following:

	{
  	  "/man0" : {
    	"Metadata" : {
      		"SourceName" : "Bens Example Driver"
	    },
   		"Readings" : [[1351043674000, 545.1]],
    	"uuid" : "646a5b82-2cfa-11e2-b80d-b8f6b119696f"
  	  }
    }
	
Save the json in a file data.json and publish it by _curl_

	$ curl -XPOST -d @data.json -H "Content-Type: application/json" http://localhost:8079/add/<KEY>

## Frontend
Parse.js and showMap.js are used to display location information.

## Useful online tools:
[JSON Parser](http://json.parser.online.fr), 
[Epoch Converter](http://www.epochconverter.com)