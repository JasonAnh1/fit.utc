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
				href="#">Sự kiện<i class="arrow right"></i></a> <a href="#">Lễ
				tốt nghiệp<i class="arrow right"></i>
			</a> <a href="#">Lễ tốt nghiệp 2021</a>
		</div>

		  <div class="container-left-right">
    <!-- content trái -->
    <div class="left-content">
      <div class="left-content-up">
        <img src="${base}/uploads/${events.avatar}">
        <div class="left-content-up-text">
          <h3>Lễ tốt nghiệp 2021</h3>
          <div class="blue-line-m"></div>
          <p style="text-align: left; font-size: 20px;">Cập nhật lần
							cuối: ${events.createdDate}</p>
		  <p>Đăng bởi: ${events.createdBy}</p>
          <p><strong>Thời gian diễn ra sự kiện: Ngày ${events.day}
								tháng ${events.month}</strong></p>
          <p><strong>Vào lúc ${events.hour} giờ ${events.minutes}</strong></p>
          <p><strong>Địa điểm: ${events.address}</strong></p>
        </div>
      </div>
    
      <div class="left-content-middle">
       <p>${events.details}</p>
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
					<h3>Tin nổi bật</h3>
					<div class="blue-line-m"></div>
					<ul>
						<li><a href="#">Thông báo về tuyển gian viên ngành công
								nghệ thông tin</a></li>
						<li><a href="#">Thông báo về đăng kí học phần thực tâp</a></li>
						<li><a href="#">tuyển dụng 2020</a></li>
						<li><a href="#">Dấu ấn dự án CNTT</a></li>
					</ul>
				</div>
				<div class="right-content-event">
					<h3>Bài viết mới nhất</h3>
					<div class="blue-line-m"></div>
					<ul>
						<li><a href="#">Thông báo về tuyển gian viên ngành công
								nghệ thông tin</a></li>
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
	</div>
</html>