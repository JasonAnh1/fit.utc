<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/user/layout/DetailLayout.jsp"></jsp:include>

</head>
<body >
	<jsp:include page="/WEB-INF/views/user/layout/DetailNav.jsp"></jsp:include>
	<div class="container-content">
		<!-- thẻ tag -->
		<div class="link-tag">
			<a href="${base}/image/LogoUTC.jpg">Trang chủ<i
				class="arrow right"></i></a> <a href="#">${categories4.name}<i
				class="arrow right"></i></a> <a href="#">${categories2.name}</i></a>
		</div>
		<div class="container-left-right">
			<!-- content trái -->
			<div class="left-content">
				<div class="left-content-up">
					<img src="${base}/uploads/${news.avatar}">
					<div class="left-content-up-text">
						<h3>${news.title}</h3>
						<div class="blue-line-m"></div>
						<p style="text-align: left; font-size: 12px;">Cập nhật lần
							cuối: ${news.createdDate}</p>
						<p>Đăng bởi: ${news.createdBy}</p>
						<p>${news.shortDes}</p>

					</div>
					8
				</div>

				<div class="left-content-middle">
					<p>${news.details}</p>

					<c:forEach items="${news.newsImages}" var="img">

						<a href="${base}/uploads/${img.path}" download>tải file
							${img.title}</a>
					</c:forEach>
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
					<h3>Sự kiện mới nhất</h3>
					<div class="blue-line-m"></div>
					<ul>
						<c:forEach items="${listEvents.data}" var="Events">
							<li><a href="#">${Events.title}</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="right-content-event">
					<h3>Bài viết mới nhất</h3>
					<div class="blue-line-m"></div>
					<ul>
						<c:forEach items="${fourNews.data}" var="News">
							<li><a href="${base }/detail/${News.seo}">${News.title}</a></li>
							<hr>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/user/layout/Footer.jsp"></jsp:include>
</html>