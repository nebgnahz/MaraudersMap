// socket.io connection establishment
var socket = io.connect('http://localhost:8888');
var displayList = {};
var displayNameList = {};
// for testing purpose
socket.on('news', function (data) {
    console.log(data);
    socket.emit('my other event', { my: 'data' });
});


// mapping hash table
var Mapping = {};

// 72, 80, 144, 160, 176
Mapping["72"] = new Point(277, 299);
Mapping["80"] = new Point(239, 210);
Mapping["144"] = new Point(277, 216); 
Mapping["160"] = new Point(193, 105);
Mapping["176"] = new Point(233, 105); 


Mapping["545.1"] = new Point(277, 299);
Mapping["545.2"] = new Point(239, 210);
Mapping["545.3"] = new Point(277, 216); 
Mapping["545.4"] = new Point(193, 105);
Mapping["545.5"] = new Point(233, 105); 
Mapping["545.6"] = new Point(287, 113);
Mapping["545.7"] = new Point(361, 220);
Mapping["545.8"] = new Point(347, 122);

Mapping["545.10"] = new Point(408, 127);
Mapping["545.11"] = new Point(474, 137);
Mapping["545.12"] = new Point(497, 231); 
Mapping["545.13"] = new Point(534, 149);
Mapping["545.14"] = new Point(590, 153);


// starting from 545P
Mapping["545.16"] = new Point(638, 161);
Mapping["545.17"] = new Point(691, 162);
Mapping["545.18"] = new Point(681, 245);
Mapping["545.19"] = new Point(710, 290);
Mapping["545.20"] = new Point(614, 311);

// starting from 545X
Mapping["545.24"] = new Point(592, 244); 


// communication with server on the newData
socket.on('newData', function(data) {
    /* potentially the data would be like:
    {
     	"location" : {
     	    "DisplayName" : "Ben Zhang",
	    "UniqueName" : "ee149.benzhang",
     	    "Readings" : [1352756278000, 545.1],
     	    "uuid" : "d8401a6e-2313-11e2-99e6-b8f6b119696f"
     	}
    }
    */

    // there should be a dictionary data type checking new entries
    var json = data;
    var obj = JSON && JSON.parse(json) || $.parseJSON(json);
    displayList[obj.location.UniqueName] = obj.location.Readings[0][1];
    displayNameList[obj.location.UniqueName] = obj.location.DisplayName;
    draw();
    console.log(data);
});

function Point(x, y) {
  this.x = x;
  this.y = y;
}
