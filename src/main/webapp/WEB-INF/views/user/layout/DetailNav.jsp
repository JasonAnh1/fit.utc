
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	max-height: 100%;
	margin: auto;
	padding: 0;
}

.container-header {
	width: 98%;
	margin-left: 1%;
}

.navbar-brand {
	position: relative;
	padding-left: 10%;
}

.Uni_name {
	position: absolute;
	left: 20%;
}

.horizon-navi {
	position: absolute;
	height: 10px;
	background-color: #00ABE1;
}

.horizon-navi2 {
	height: 20px;
	background-color: #00ABE1;
}

/* search bar */
.search-bar-head {
	position: absolute;
	margin-left: 80%;
	width: 200px;
}

.container-search-bar {
	padding-bottom: 0px;
}

.height {
	height: 0px;
}

.form-for-s {
	position: relative;
}

.form-for-s .fa-search {
	position: absolute;
	top: 13px;
	left: 240px;
	color: #9ca3af
}

.
.form-input {
	height: 55px;
	width: 100px;
	border-radius: 10px
}

.form-input:focus {
	box-shadow: none;
	border: none
}

/* hết search bar */
.blue-line {
	height: 7px;
	background-color: #187bcd;
	position: relative;
	top: 5px;
	z-index: 10000000;
}

/* nav bar */
.nav-size {
	width: 100%;
	background: #464646;
	height: 45px;
}

.nav-size nav {
	width: 80%;
}

nav:after {
	content: '';
	clear: both;
	display: table;
}

nav ul {
	float: right;
	list-style: none;
	position: relative;
	margin-top: -20px;
	margin-bottom: -20px;
}

nav ul li {
	float: left;
	display: inline-block;
	background: #464646;
}

nav ul li a {
	color: white;
	text-decoration: none;
	line-height: 33px;
	padding: 10px 20px;
	margin-bottom: -12px;
}

nav ul li a:hover {
	color: cyan;
	border-radius: 5px;
}

nav ul ul {
	position: absolute;
	opacity: 0;
	visibility: hidden;
	z-index: 999;
	transition: .5s;
}

nav ul li:hover>ul {
	opacity: 1;
	visibility: visible;
}

nav ul ul li {
	position: relative;
	margin: 0px;
	width: 250px;
	float: none;
	display: list-item;
	background-color: #464646;
	left: -32px;
	top: 21px;
}

nav ul ul li a {
	text-align: left;
}

nav ul ul li a:hover {
	color: cyan;
	box-shadow: none;
}

.show, .icon, input {
	display: none;
}

.nav-arrow {
	display: flex;
	height: 100%;
	width: auto;
	border-left: 0.5px solid #808080;
}

.nav-arrow a {
	position: relative;
	top: -10px;
}

.nav-arrow label {
	position: relative;
	right: 40px;
	top: 6px;
	color: blue;
	font-size: 10px;
}

.right-col-line {
	border-right: 0.5px solid #808080;
}

/* box container */
.container-content {
	width: 90%;
	margin-left: 5%;
}

/* phần thẻ link */
.link-tag {
	width: 100%;
	padding: 20px 0px 20px 0px;
}

.link-tag a {
	text-decoration: none;
	font-size: 20px;
	color: black;
	padding: 5px;
}

/* tạo mũi tên diều hướng */
.arrow {
	border: solid black;
	border-width: 0 3px 3px 0;
	display: inline-block;
	padding: 3px;
}

.right {
	transform: rotate(-45deg);
	-webkit-transform: rotate(-45deg);
}

.container-left-right {
	display: flex;
}

.blue-line-m {
	height: 4px;
	background-color: #187bcd;
	width: 35px;
}

.left-content {
	width: 65%;
	height: 200px;
	margin-right: 5px;
}

.left-content .left-content-up img {
	width: 45%;
	height: auto;
}

.left-content-up-text {
	width: 55%;
	float: right;
	padding-left: 20px;
}

.left-content .left-content-up .left-content-up-text p {
	padding: 5px;
}

.right-content {
	width: 35%;
	height: auto;
}

.left-content .left-content-down {
	text-align: center;
}

.left-content .left-content-down i {
	padding: 10px;
	font-size: 26px;
}

/* right content*/
.right-content .right-content-event ul li {
	position: relative;
	right: 37px;
	padding: 7px;
	list-style: none;
}

.right-content .right-content-event hr {
	position: relative;
	right: 37px;
	opacity: 0.1;
}

.right-content-event ul li a {
	text-decoration: none;
	color: black;
}

/*responsive cho điện thoại */
@media all and (max-width: 800px) {
	.left-content .left-content-up {
		display: block;
	}
	.left-content {
		width: 90%;
		margin-left: 5%;
		display: block;
		float: none;
		position: static;
		height: auto;
	}
	.left-content .left-content-up img {
		width: 100%;
	}
	.left-content .left-content-up p {
		text-align: center !important;
	}
	.left-content .left-content-up .blue-line-m {
		display: none;
	}
	.link-tag {
		text-align: center;
	}
	.container-left-right {
		display: block;
	}
	.left-content-up-text {
		width: 100%;
		text-align: center;
		float: none;
		height: auto;
		display: block;
	}
	.right-content {
		display: flex;
		width: 100%;
	}
	.right-content .right-content-event hr {
		position: static !important;
	}
	.right-content .right-content-event ul li {
		position: static !important;
	}

	/*tên trường*/
	.Uni_name {
		position: absolute;
		left: 30%;
		font-size: 16px;
	}
	.left-content-middle {
		display: block;
	}
}

@media all and (max-width: 1300px) {
	/* chỉnh search bar */
	.search-bar-head {
		margin-left: 0%;
		top: 110px;
	}
	.form-input {
		height: 30px;
		text-indent: 25px;
		border-radius: 4px
	}
	.form-for-s .fa-search {
		position: absolute;
		top: 8px;
		left: 240px;
	}

	/*hết chỉnh search bar*/

	/*ten truong */
	.Uni_name {
		position: absolute;
		left: 30%;
	}
	.logo {
		font-size: 26px;
		color: #464646;
	}
	.blue-line {
		display: none;
	}
	.nav-size {
		height: auto;
		padding-bottom: 15px;
	}
	.nav-arrow {
		border-left: none;
	}
	.right-col-line {
		border-right: none;
	}
	nav ul {
		margin-right: 0px;
		float: left;
		margin-top: 20px;
		padding-bottom: 20px;
	}
	nav ul li {
		display: inline-block;
		background: #464646;
		border: none;
	}
	nav ul li, nav ul ul li {
		display: block;
		width: 100%;
	}
	nav ul ul li {
		top: -35px;
		left: 6px;
	}
	nav ul ul {
		top: 70px;
		position: static;
		float: none;
		display: none;
		opacity: 1;
		visibility: visible;
	}
	.show {
		display: block;
		color: white;
		font-size: 18px;
		padding: 0px 20px;
		line-height: 30px;
		cursor: pointer;
	}
	.need-color {
		color: white;
	}
	.icon {
		display: block;
		color: white;
		position: absolute;
		right: 30px;
		top: 90px;
		line-height: 70px;
		font-size: 25px;
		cursor: pointer;
	}
	nav ul li a: hover {
		box-shadow: none;
	}
	.show+a, ul {
		display: none;
	}
	[id^=btn]:checked+ul {
		display: block;
	}
}

.colapse-icon {
	font-size: 15px;
}

.search-form input {
	position: relative;
	height: 20px;
}

.has-search .form-control {
	padding-left: 2.375rem;
}

.form-control {
	width: 130%;
}
</style>
<nav
	class="navbar navbar-expand-sm bg-white navbar-dark container-header">
	<div class="container-fluid">
		<a class="navbar-brand" href="${base}/index"> <img
			src="${base}/image/LogoUTC.jpg" alt="Avatar Logo"
			style="width: 80px;" class="rounded-pill">
		</a>
		<h5 class="Uni_name">
			TRƯỜNG ĐẠI HỌC GIAO THÔNG VẬN TẢI<br> KHOA CÔNG NGHỆ THÔNG TIN
		</h5>
	</div>
	<!-- đây là search bar  -->
	<div class="search-bar-head">
		<div class="container-search-bar">
			<div
				class="row height d-flex justify-content-center align-items-center">
				<div class="form-for-s">
					<i class="fa fa-search"></i> <input type="text"
						class="form-control form-input" placeholder="Search anything...">
				</div>
			</div>
		</div>
	</div>
</nav>
<!-- blueline -->
<div class="blue-line"></div>

<div class="nav-size">
	<nav>
		<div style="color: #464646;">UTC</div>
		<label for="btn" class="icon"> <span class="fa fa-bars"></span>
		</label> <input type="checkbox" id="btn">
		<ul>
			<c:forEach items="${categories}" var="cate1" begin="0" end="0">
				<li>
					<div class="nav-arrow">
						<a href="${base}/index" style="display: block;">${cate1.name}</a>
					</div>
				</li>
			</c:forEach>
			<c:forEach items="${categories}" var="cate2" begin="1" end="8">
				<li>
					<div class="nav-arrow">
						<a href="${base }/category/${cate2.id}" style="display: block;">${cate2.name}</a>
						<label for="btn-${cate2.id}" class="show"><i
							class="fas fa-caret-down"
							style="user-select: auto; color: white; margin-left: 10px;"></i></label>
					</div> <input type="checkbox" id="btn-${cate2.id}">

					<ul>
						<c:forEach items="${categories}" var="cate3">
							<c:if test="${cate3.getParent().getId()==cate2.getId()}">
								<li><a href="${base }/category/${cate3.id}">${cate3.getName()}</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</c:forEach>

		</ul>
	</nav>
</div>