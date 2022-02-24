<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="col-3 bg-dark ">
	<div
		class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark sidebar"
		style="width: 280px;">
		<a href="/"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
			<svg class="bi me-2" width="40" height="32">
				<use xlink:href="#bootstrap"></use></svg> <span class="fs-4"><img
				src="${base}/image/LogoUTC.jpg" class="rounded-circle pl"
				width="50px" alt="Cinque Terre">Trang quản trị trang web
				fit.utc</span>
		</a>
		<hr>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn btn-dark dropdown-toggle active"
						data-bs-toggle="dropdown">Quản lý danh mục</button>
					<ul class="dropdown-menu bg-dark">
						<li><a class="dropdown-item  text-white"
							href="${base}/admin/listCategories">Danh sách</a></li>
						<li><a class="dropdown-item  text-white"
							href="${base}/admin/addCategories">Thêm</a></li>
					</ul>
				</div>
			</li>
			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn btn-dark dropdown-toggle"
						data-bs-toggle="dropdown">Quản lý bài viết</button>
					<ul class="dropdown-menu bg-dark">
						<li><a class="dropdown-item  text-white"
							href="${base}/admin/listNews">danh sách bài viết</a></li>
						<li><a class="dropdown-item  text-white"
							href="${base}/admin/addNews">Thêm</a></li>
					</ul>
				</div>
			</li>
			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn btn-dark dropdown-toggle"
						data-bs-toggle="dropdown">Quản lý sự kiện</button>
					<ul class="dropdown-menu bg-dark">
						<li><a class="dropdown-item  text-white"
							href="${base}/admin/listEvents">danh sách sự kiện</a></li>
						<li><a class="dropdown-item  text-white"
							href="${base}/admin/addEvents">Thêm</a></li>
					</ul>
				</div>
			</li>
			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn btn-dark dropdown-toggle"
						data-bs-toggle="dropdown">Quản lý tài khoản</button>
					<ul class="dropdown-menu bg-dark">
						<li><a class="dropdown-item  text-white" href="${base}/admin/customerAccount">Danh
								sách tài khoản khách</a></li>
						<li><a class="dropdown-item  text-white" href="${base}/admin/adminAccount">Danh
								sách tài khoản admin</a></li>
						<li><a class="dropdown-item  text-white" href="${base}/admin/addAccount">Thêm</a></li>
					</ul>
				</div>

			</li>
			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn btn-dark dropdown-toggle"
						data-bs-toggle="dropdown">Quản lý banner</button>
					<ul class="dropdown-menu bg-dark">
						<li><a class="dropdown-item  text-white"
							href="${base}/admin/listBanner">Danh sách</a></li>
						<li><a class="dropdown-item  text-white"
							href="${base}/admin/addBanner">Thêm</a></li>
					</ul>
				</div>
			</li>
			<!-- 	<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn btn-dark dropdown-toggle"
						data-bs-toggle="dropdown">Lịch sử</button>
					<ul class="dropdown-menu bg-dark">
						<li><a class="dropdown-item  text-white" href="#">Danh
								sách</a></li>
						<li><a class="dropdown-item  text-white" href="#">Thêm</a></li>
					</ul>
				</div>
			</li> -->
		</ul>
		<hr>
		<div class="dropdown">
			<a href="#"
				class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
				id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
				<img src="${base}/image/LogoUTC.jpg" alt="" width="32" height="32"
				class="rounded-circle me-2"> <strong>${userLogined.username}</strong>
			</a>
			<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
				aria-labelledby="dropdownUser1">
				<li><a class="dropdown-item" href="#">New project...</a></li>
				<li><a class="dropdown-item" href="#">Settings</a></li>
				<li><a class="dropdown-item" href="#">Profile</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="${base}/logout">Sign out</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- end sidebar -->