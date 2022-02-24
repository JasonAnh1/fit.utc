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
<body>
	<jsp:include page="/WEB-INF/views/user/layout/DetailNav.jsp"></jsp:include>


	<div class="container-content">
		<!-- thẻ tag -->
		<div class="link-tag">
			<a href="#">Trang chủ<i class="arrow right"></i></a> <a href="#">Sự
				kiện<i class="arrow right"></i>
			</a> <a href="#">Lễ tốt nghiệp<i class="arrow right"></i></a> <a href="#">Lễ
				tốt nghiệp 2021</a>
		</div>

		<div class="container-left-right">
			<!-- content trái -->
			<div class="left-content">
				<div class="left-content-up">
					<img src="${base}/uploads/${events.avatar}">
					<div class="left-content-up-text">
						<h3>${events.title}</h3>
						<div class="blue-line-m"></div>
						<p style="text-align: left; font-size: 12px;">Cập nhật lần
							cuối: ${events.createdDate}</p>
						<p>Đăng bởi: ${events.createdBy}</p>
						<p>
							<strong>Thời gian diễn ra sự kiện: Ngày ${events.day}
								tháng ${events.month}</strong>
						</p>
						<p>
							<strong>Vào lúc ${events.hour} giờ ${events.minutes}</strong>
						</p>
						<p>
							<strong>Địa điểm: ${events.address}</strong>
						</p>
					</div>
					8
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
					<h3>Sự kiện mới nhất</h3>
					<div class="blue-line-m"></div>
					<ul>
						<c:forEach items="${listEvents.data}" var="Events">
							<li><a href="${base}/detailE/${Events.seo}">${Events.title}</a></li>
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