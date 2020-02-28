<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
<head>
<title>Login page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* Set a style for all buttons */
button {
	background-color: #000000;
	color: #ffffff;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 15%;
	border-radius: 30%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 40%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}

.topnav {
	overflow: hidden;
	background-color: black;
}
.topnav a {
	float: left;
	color: #ffffff;
	text-align: center;
	padding: 16px 16px;
	text-decoration: none;
	font-size: 17px;
	display: inline-block;
	vertical-align: middle;
	content: "";
	background:;
	background-size: 100% 100%;
	align-items: center;
}
.topnav a:hover {
	background-color: #blue;
	color: red;
}
.topnav a.active {
	background: url('assets/images/login.png');
	color: white;
	padding: 5px 15px, 5px;
	border-radius: 20px;
}
.topnav a.right {
	float: right;
}
.orange {
	color: #ed6c0d;
	cursor: pointer !important;
}
.white {
	color: #ffffff;
	cursor: pointer !important;
}
.right {
	float: right;
}
</style>
</head>
<body>
	<div class="topnav">
		<a class="active" href="">CRICKETAUCTION</a>
					
				<button class="right" onclick="document.getElementById('id01').style.display='block'" 
		style="width: auto;">LOGIN</button>
<a href="BestBat.jsp">BEST BATSMAN</a>
  <a href="BestBowl.jsp">BEST BOWLER</a>
  <a href="FindRole.jsp">FIND ROLE</a>
  <a href="ExperiencePlayers.jsp">EXPERIENCE PLAYERS</a>
  <a href="TeamPlayer.jsp">TEAM PLAYERS</a>
								</div>
	<div style="padding-left: 16px">
		<h2></h2>
		<p></p>
	</div>

	<img src="assets/images/ipl002.jpg" width="1350" height="550">
	

	<div id="id01" class="modal">

		<form class="modal-content animate" action="Register" method="get">
			<div class="imgcontainer">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="close" title="Close Modal">&times;</span> <img
					src="assets\images\admin-avatar.png" alt="Avatar" class="avatar">
			</div>

			<div class="container">
				<label for="uname"><b>Username</b></label> <input type="text"
					placeholder="Enter Username" name="uname" required> <label
					for="psw"><b>Password</b></label> <input type="password"
					placeholder="Enter Password" name="psw" onkeypress="capLock(event)" required>
<div id="divMayus" style="visibility:hidden;margin-top:15px;color:red;">Caps Lock is on.</div>

				<button type="submit">Login</button>
				<label> <input type="checkbox" checked="checked"
					name="remember"> Remember me
				</label>
			</div>

			<div class="container" style="background-color: #f1f1f1">
				<button type="button"
					onclick="document.getElementById('id01').style.display='none'"
					class="cancelbtn">Cancel</button>

			</div>
		</form>
	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('id01');

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
		function capLock(e){
 kc = e.keyCode?e.keyCode:e.which;
 sk = e.shiftKey?e.shiftKey:((kc == 16)?true:false);
 if(((kc >= 65 && kc <= 90) && !sk)||((kc >= 97 && kc <= 122) && sk))
  document.getElementById('divMayus').style.visibility = 'visible';
 else
  document.getElementById('divMayus').style.visibility = 'hidden';
}
	</script>
</body>
</html>