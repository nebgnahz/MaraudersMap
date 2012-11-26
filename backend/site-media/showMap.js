var canvas, mapObj;
colorList = ["255, 0, 56", "255, 127, 0", "0, 255, 0", "65, 105, 225", "160, 32, 240"];

init();

$("#map").click(function(e){
    var x = Math.floor((e.pageX-$("#map").offset().left));
    var y = Math.floor((e.pageY-$("#map").offset().top));
    console.log("new Point(" + String(x) + ", " + String(y) + ");");
});

function init() {
    canvas = document.getElementById("map");
    context = canvas.getContext("2d");

    mapObj = new Image();
    mapObj.onload = function() {
	context.drawImage(mapObj, 27, 29);
    };

    //image size: 746*342
    mapObj.src = 'images/DOPcenter.gif';
    // return setInterval(draw, 1000);
}


function clear() {
    context.clearRect(0, 0, canvas.width, canvas.height);
}

function draw() {
    clear();
    context.drawImage(mapObj, 27, 29);
    var i = 0;
    for (var key in displayList) {
	// do something with key
	if (displayList[key] in Mapping) {
            var point = Mapping[displayList[key]];
	    
	    context.fillStyle = "rgba(" + colorList[i] + ", 0.3)";
	    context.beginPath();
	    context.moveTo(point.x, point.y);
	    context.arc(point.x + Math.floor((Math.random()*10)+1), 
			point.y + Math.floor((Math.random()*10)+1)
			, 15, 0, Math.PI*2, false);
	    context.fill();

	    context.fillStyle = 'rgba(' + colorList[i] + ', 1)';
	    context.moveTo(825, i*30+50);
	    context.arc(825, i*30+50, 8, 0, Math.PI*2, false);
	    context.fill();
	    context.font = 'bold 20px sans-serif';
	    context.fillStyle = 'black'
	    context.textBaseline = "middle";
	    context.fillText(displayNameList[key], 845, i*30+50);
	    i++;
	}
	
    }
}
