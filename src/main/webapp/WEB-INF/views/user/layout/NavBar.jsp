
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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