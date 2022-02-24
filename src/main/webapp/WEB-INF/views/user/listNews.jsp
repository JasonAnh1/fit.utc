<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>News</title>
<!--  fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- link đến css -->
<link rel="stylesheet" type="text/css" href="${base}/css/tintuc.css">
<link rel="stylesheet" type="text/css" href="${base}/css/bodynews.css">
<link rel="stylesheet" type="text/css"
	href="${base}/css/simplePagination.css">
<!--  thư viện boostrap -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- link đến js-->
</head>
<body>
	<!-- navbar -->
	<jsp:include page="/WEB-INF/views/user/layout/NavBar.jsp"></jsp:include>

	<!-- container -->
	<div class="container-box">
		<!-- phần đầu -->
		<div class="link-tag">
			<a href="#">Trang chủ<i class="fas fa-angle-right"></i></a> <a
				href="#">Sự kiện</a>
		</div>
		<!--phần giữa-->
		<div class="container-box-mid">
			<div class="box-m-left">
				<h2>
					<strong>Tin tức-Sự kiện</strong>
				</h2>
				<ul>
					<a href="#" style="font-size: 20px; text-decoration: none;">Tin
						tức</a>
					<li><a href="#">Tin trong trường</a></li>
					<li><a href="#">Tin công nghệ</a></li>
					<li><a href="#">Đoàn thanh niên</a></li>
					<li><a href="#">Tin trong khoa</a></li>
					<li><a href="#">Hội thảo khoa học</a></li>
				</ul>
			</div>
			<div class="box-m-right">
				<div class="box-r-img">
					<img src="${base}/image/sliden.png"
						style="width: 100%; height: auto;">
				</div>
				<div class="row main-content">

					<div class="col-md-8 box-test">
						<div class="row">
							<c:forEach items="${news.data}" var="news">
								<div class="news-content col-md-6">
									<a href="#"><img src="${base}/uploads/${news.avatar}"
										style="width: 100% px; height: 200px;"></a>
									<div class="text-content">
										<a href="${base}/detail/${news.seo}"><strong>${news.title}</strong></a>
										<div class="detail">${news.createdDate}</div>
										<p>${news.shortDes}</p>

									</div>
								</div>
							</c:forEach>
						</div>

					</div>
					<div class="col-md-4 box-test">
						<div class="right-content">
							<div class="right-content-event">
								<h3>Tin nổi bật</h3>
								<div class="blue-line-m"></div>
								<ul>
									<li><a href="#">Thông báo về tuyển gian viên ngành
											công nghệ thông tin</a></li>
									<li><a href="#">Thông báo về đăng kí học phần thực tâp</a></li>
									<li><a href="#">tuyển dụng 2020</a></li>
									<li><a href="#">Dấu ấn dự án CNTT</a></li>
								</ul>
							</div>
							<div class="right-content-event">
								<h3>Bài viết mới nhất</h3>
								<div class="blue-line-m"></div>
								<ul>
									<li><a href="#">Thông báo về tuyển gian viên ngành
											công nghệ thông tin</a></li>
									<hr>
									<li><a href="#">Thông báo về đăng kí học phần thực tâp</a></li>
									<hr>
									<li><a href="#">tuyển dụng 2020</a></li>
									<hr>
									<li><a href="#">Dấu ấn dự án CNTT</a></li>
									<hr>
								</ul>
							</div>
						</div>
					</div>

					<hr>
				</div>
</body>
<jsp:include page="/WEB-INF/views/admin/layout/Footer.jsp"></jsp:include>
</html>