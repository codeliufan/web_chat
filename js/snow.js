window.onload = function () {
	// var canvas = document.createElement("canvas");
	var canvas = document.getElementsByTagName("canvas")[0];
	

	var ctx = canvas.getContext("2d");
	var cW = window.innerWidth;
	var cH = window.innerHeight;
	var timer=null;

	init();
	function init() {
		// document.body.appendChild(canvas);
		canvas.width = cW;
		canvas.height = cH;
		// draw();
		timer = setInterval(function () {
			loop();
		},30);
	}
/*	function draw() {
		ctx.beginPath();
		ctx.fillStyle = "orange";
		ctx.arc(100,100,5,0,2*Math.PI,false);
		ctx.fill();
		ctx.closePath();
	}*/

	var snowflakes = [];
	function loop() {
		var canvasX = Math.random()*cW;
		var canvasY = 0;
		var color = getRandomColor();
		// 清除重叠
		ctx.clearRect(0,0,cW,cH);
		var snowflake = new Snowflake(canvasX,canvasY,2.5,color);
		var len = snowflakes.length;
		snowflake.xVel = Math.random()*2-1;
		snowflakes.push(snowflake);
		for(var i=0; i<len; i++){
			var bu = snowflakes[i];
			bu.draw();
			bu.updatePoint();
		}
		if(len>400){
			snowflakes.shift();
		}
	}

	function Snowflake(x,y,r,color) {
		this.x = x;
		this.y = y;
		this.r = r;
		this.color = color;
		this.yVel = 1;
		this.xVel = 0;
		this.g = Math.round((Math.random()*1+1)*10)/5000;
		// console.log(this.g)
		this.draw = function () {
			ctx.beginPath();
			ctx.fillStyle = this.color;
			ctx.arc(this.x,this.y,this.r,0,2*Math.PI,false);
			ctx.fill();
			ctx.closePath();
		}
		this.updatePoint = function () {
			this.yVel += this.g;
			this.y += this.yVel;
			this.x += this.xVel;
			/*this.color = "rgba("+Math.round(Math.random()*255)+","+Math.round(Math.random()*255)+","+Math.round(Math.random()*255)+","+Math.random()+")";*/
		}
	}

	function getRandomColor () {
		return "rgba(255,255,255,"+Math.random()*0.8+")";
	}
};