<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- link to CSS -->
<link rel="stylesheet" type="text/css" href="${base}/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${base}/css/navbar-dropdown.css">
<link rel="stylesheet" type="text/css" href="${base}/css/baiviet.css">
<!-- link to font awsome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<title>Detail</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/user/layout/NavBar.jsp"></jsp:include>

	<!-- thẻ chứa toàn bộ content -->
	<div class="container-content">
		<!-- thẻ tag -->
		<div class="link-tag">
			<a href="${base}/index">Trang chủ<i class="arrow right"></i></a> <a
				href="#">Bộ môn<i class="arrow right"></i></a> <a href="#">${dp.name}</i></a>
		</div>

		<div class="container-left-right">
			<!-- content trái -->
			<div class="left-content">
				<div class="left-content-up">
				<img src="${base}/image/sliden.png">
					<div class="left-content-up-text">
						<h3>${dp.name}</h3>
						<div class="blue-line-m"></div>
						<p style="font-size: 20px;">Cập nhật lần cuối:
							${dp.createdDate}</p>
						<p>Đăng bởi: ${dp.createdBy}</p>
					</div>
				</div>

				<div class="left-content-middle">
					<p>${dp.detail}</p>


					<hr>
				</div>
				<div class="left-content-down">
					<!-- Facebook -->
					<i class="fab fa-facebook-f"></i>

					<!-- Twitter -->
					<i class="fab fa-twitter"></i>

					<!-- Google -->
					<i class="fab fa-google"></i>

					<!-- Instagram -->
					<i class="fab fa-instagram"></i>

					<!-- Linkedin -->
					<i class="fab fa-linkedin-in"></i>

					<!-- Stack overflow -->
					<i class="fab fa-stack-overflow"></i>

					<!-- Youtube -->
					<i class="fab fa-youtube"></i>

					<!-- Reddit -->
					<i class="fab fa-reddit-alien"></i>
				</div>
			</div>

			<!-- content phải -->
			<div class="right-content">
				<div class="right-content-event">
					<h3>Danh Sách Cán bộ</h3>
					<div class="blue-line-m"></div>
					<a href="${base}/Userlistlecturers" class="link-to-go">Danh sách cán bộ</a>

				</div>
				<div class="right-content-event">
					<h3>Bài viết mới nhất</h3>
					<div class="blue-line-m"></div>
					<ul>
						<c:forEach items="${fourNews.data}" var="o">

							<li><a href="${base}/detail/${o.seo}" class="link-to-go">${o.title}</a></li>

						</c:forEach>

						<hr>
					</ul>
				</div>

			</div>
		</div>
	</div>
</html>