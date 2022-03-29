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
		<h3>Trường Đại Học Giao Thông Vận Tải</h3>
		<h3>Khoa Công Nghệ Thông Tin</h3>
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



<%--<div class="nav-size">--%>
<%--	<nav>--%>
<%--		<div style="color: #464646;">UTC</div>--%>
<%--		<label for="btn" class="icon"> <span class="fa fa-bars"></span>--%>
<%--		</label> <input type="checkbox" id="btn">--%>
<%--		<ul>--%>
<%--			<c:forEach items="${categories}" var="cate1" begin="0" end="0">--%>
<%--				<li>--%>
<%--					<div class="nav-arrow">--%>
<%--						<a href="${base}/index" style="display: block;">${cate1.name}</a>--%>
<%--					</div>--%>
<%--				</li>--%>
<%--			</c:forEach>--%>
<%--			<c:forEach items="${categories}" var="cate2" begin="1" end="8">--%>
<%--				<li>--%>
<%--					<div class="nav-arrow">--%>
<%--						<a href="${base }/category/${cate2.id}" style="display: block;">${cate2.name}</a>--%>
<%--						<label for="btn-${cate2.id}" class="show"><i--%>
<%--							class="fas fa-caret-down"--%>
<%--							style="user-select: auto; color: white; margin-left: 10px;"></i></label>--%>
<%--					</div> <input type="checkbox" id="btn-${cate2.id}">--%>

<%--					<ul>--%>
<%--						<c:forEach items="${categories}" var="cate3">--%>
<%--							<c:if test="${cate3.getParent().getId()==cate2.getId()}">--%>
<%--								<li><a href="${base }/category/${cate3.id}">${cate3.getName()}</a></li>--%>
<%--							</c:if>--%>
<%--						</c:forEach>--%>
<%--					</ul>--%>
<%--				</li>--%>
<%--			</c:forEach>--%>

<%--		</ul>--%>
<%--	</nav>--%>
<%--</div>--%>