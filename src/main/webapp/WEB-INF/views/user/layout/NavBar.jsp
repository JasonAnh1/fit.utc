<%@ page import="java.util.*, java.text.*"%>
<%@ page import="java.util.List, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header class="container-fluid row">
	<!-- 1. logo's UTC -->
	<div class="col-2 box a">
		<a href="${base}/index" class="link-to-go"> <img
			src="${base}/image/logoUTC.jpg"
			class="rounded mx-auto d-block utc-logo">
		</a>
	</div>
	<!-- 2. UTC's name -->
	<div class="col-7 box b utc-name">
		 <div class="utc-name-l0">
         <h3 class="utc-name-n1" data-text="TRƯỜNG ĐẠI HỌC GIAO THÔNG VẬN">TRƯỜNG ĐẠI HỌC GIAO THÔNG VẬN</h3>
         <h3 data-text="KHOA CÔNG NGHỆ THÔNG TIN">KHOA CÔNG NGHỆ THÔNG TIN</h3>  
        </div>
	</div>
	 
	<!-- 3. Login functional -->
	<div class="col-3 box log-c">
		<!-- in here we have 2 section: "search-bar" "login" -->
		<div class="login-logout">
			<a href="#">Giảng Viên</a> <a href="#">Đăng kí</a> <a href="#">Đăng
				Nhập</a>
		</div>
		<div class="wrap">
			<div class="search">
				<input type="text" class="searchTerm"
					placeholder="What are you looking for?">
				<button type="submit" class="searchButton">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>
	</div>
</header>
<div class="blue-line"></div>

<!-- navbar dropdown button -->
<nav>
	<div class="wrapper">
		<input type="radio" name="slider" id="menu-btn"> <input
			type="radio" name="slider" id="close-btn">
		<ul class="nav-links">
			<label for="close-btn" class="btn close-btn"><i
				class="fas fa-times"></i></label>


			<li><c:forEach items="${categories}" var="cate1"
					varStatus="loop">
					<c:if test="${cate1.getParent().getId()==109}">
						<li><a href="${base}/category/${cate1.id}" class="none-link">${cate1.name}</a>

							<label for="showDrop-${loop.index}" class="mobile-item"><a
								href="${base}/category/${cate1.id}" class="link-to">${cate1.name}</a><i
								class=" fas fa-caret-down" style="user-select: auto;"></i></label> <input
							type="checkbox" id="showDrop-${loop.index}">
							<ul class="drop-menu">

								<c:if test="${cate1.getName() == 'Tin tức - Sự kiện'}">
									<li><a href="${base}/ListEvents">Sự kiện</a></li>
								</c:if>
								<c:forEach items="${categories}" var="cate2">

									<c:if test="${cate2.getParent().getId()==cate1.getId()}">

										<li><a href="${base}/category/${cate2.id}">${cate2.getName()}</a></li>
									</c:if>

								</c:forEach>
								<c:if test="${cate1.getName() == 'Giới thiệu'}">
									<li><a href="${base}/Userlistlecturers">Danh sách
											cán bộ</a></li>
									<c:forEach items="${Department.data}" var="De">
										<li><a href="${base}/Department/${De.seo}">${De.name}</a></li>
									</c:forEach>
								</c:if>
								<c:if test="${cate1.getName() == 'Sinh viên'}">
									<li><a href="${base}/form">Biểu mẫu sinh viên</a></li>
								</c:if>
							</ul></li>
					</c:if>
				</c:forEach></li>
		</ul>
		<label for="menu-btn" class="btn menu-btn"><i
			class="fa fa-bars"></i></label>
	</div>
</nav>
