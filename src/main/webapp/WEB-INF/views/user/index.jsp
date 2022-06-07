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
<link rel="stylesheet" type="text/css" href="${base}/css/carousel.css">
<link rel="stylesheet" type="text/css" href="${base}/css/news.css">
<link rel="stylesheet" type="text/css" href="${base}/css/events.css">
<link rel="stylesheet" type="text/css" href="${base}/css/admission.css">
<link rel="stylesheet" type="text/css"
	href="${base}/css/cooperation.css">
<link rel="stylesheet" type="text/css" href="${base}/css/alumni.css">
<link rel="stylesheet" type="text/css"
	href="${base}/css/people-said.css">
<link rel="stylesheet" type="text/css" href="${base}/css/sponsor.css">
<link rel="stylesheet" type="text/css" href="${base}/css/about-us.css">
<link rel="stylesheet" type="text/css" href="${base}/css/footer.css">
<%--   background--%>
<style>
.event-news {
	padding: 10px;
	height: 500px;
	background-image: url('${base}/image/background-swiper.png');
}

.cooperation {
	background-image: url('${base}/image/slide1.jpg');
	background-repeat: no-repeat;
	background-size: 100% 100%;
}
</style>
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
<title>Home</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/user/layout/NavBar.jsp"></jsp:include>


	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<c:forEach items="${fourBanner.data}" var="o" varStatus="loop"
				begin="1">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="${loop.count}" aria-label="Slide 2"></button>
			</c:forEach>

		</div>
		<div class="carousel-inner">
			<c:forEach items="${fourBanner.data}" var="o" varStatus="loop"
				begin="0" end="0">
				<div class="carousel-item active">
					<img src="${base}/uploads/${o.avatar}" class="d-block w-100"
						alt="...">
					<div class="carousel-caption carousel-caption-css">
						<h3>${o.title}</h3>
						<p>${o.shortDes}</p>
						<a href=${base}/DetailBanner?cid=${o.id}><div
								class="btn  btn-outline-primary ">xem thêm</div></a>
					</div>
				</div>
			</c:forEach>
			<c:forEach items="${fourBanner.data}" var="o" varStatus="loop"
				begin="1">
				<div class="carousel-item">
					<img src="${base}/uploads/${o.avatar}" class="d-block w-100"
						alt="...">
					<div class="carousel-caption carousel-caption-css">
						<h3>${o.title}</h3>
						<p>${o.shortDes}</p>
						<a href="${base}/DetailBanner?cid=${o.id}">
							<div class="btn  btn-outline-primary ">xem thêm</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>

	</div>





	<div class="news">
		<h3 class="text-center pt-5">TIN MỚI NHẤT</h3>
		<div class="row container-news">
			<c:forEach items="${fourNews.data}" var="o">
				<div class="col-md-3">
					<a href="${base}/detail/${o.seo}" class="link-to-go">
						<div class="card-news-bag">
							<img src="${base}/uploads/${o.avatar}" class="card-news"
								alt="...">
							<h5 class="card-title">${o.title}</h5>
							<p class="card-text">${o.shortDes}</p>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>

		<div class="more-info">
			<h5 style="text-align: center; color: white;">
				<a href="${base}/news" class="link-to-go">Xem thêm tin tức</a>
			</h5>
		</div>


		<!-- Swiper JS -->
		<div class="event-news">
			<h2 class="event-news-title">Sự kiện mới nhất</h2>
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<c:forEach items="${listEvents.data}" var="o">
						<div class="swiper-slide">
							<a href="${base}/detailE/${o.seo}" class="link-to-go">
								<div class="event-img">
									<img src="${base}/uploads/${o.avatar}">
								</div>
								<div class="calender-event">
									<h1>${o.day}</h1>
									<h3>TH ${o.month}</h3>
								</div>
								<div class="calender-event-info">
									<h2>${o.title}</h2>
									<div class="calender-event-info-p">
										<p>thời gian: ${o.hour}:${o.minutes} PM</p>
										<p>địa điểm: ${o.address}</p>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-pagination"></div>
			</div>
		</div>

		<div class="more-info">
			<h5 style="text-align: center; color: white;">
				<a href="${base}/ListEvents" class="link-to-go">Xem thêm sự
					kiện</a>
			</h5>
		</div>

		<div class="admission-and-educate">
			<div class="admission-and-educate-title">
				<h2>ĐÀO TẠO – TUYỂN SINH</h2>
				<p></p>
			</div>
			<div class="admission-container">
				<div class="row">
					<c:forEach items="${twoEdu.data}" var="o">
						<div class="col-md-6">
							<figure class="admission-and-educate-img">
								<img src="${base}/uploads/${o.avatar}">
								<a href="${base}/detail/${o.seo}" class="link-to-go">
									<div>
										<h5>${o.title}</h5>
										<p>${o.shortDes}</p>
									</div>
								</a>
							</figure>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<div class="cooperation">
			<div class="cooperation-title">
				<h2>HỢP TÁC – ĐỐI NGOẠI</h2>
				<p></p>
			</div>
			<div class="admission-container">
				<div class="row">
					<c:forEach items="${twoContact.data}" var="o">
						<div class="col-md-6">
							<figure class="admission-and-educate-img">
								<img src="${base}/uploads/${o.avatar}" class="img-fluid"
									alt="Responsive image">
								<a href="${base}/detail/${o.seo}" class="link-to-go">
									<div>
										<h5>${o.title}</h5>
										<p>${o.shortDes}</p>
									</div>
								</a>
							</figure>
						</div>
					</c:forEach>

				</div>
			</div>


		</div>


		<div class="alumni">
			<h1>Cựu Sinh Viên</h1>
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<c:forEach items="${oldStudent.data}" var="o">
						<div class="swiper-slide">
							<a href="#" class="link-to-go">
								<div class="event-img">
									<img src="${base}/uploads/${o.avatar}">
								</div>
								<div class="alumni-tag">
									<p>cựu sinh viên</p>
								</div>
								<div class="alumni-line"></div>

								<div class="alumni-text">
									<h5>${o.title}</h5>
									<p>${o.shortDes}</p>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-pagination"></div>

			</div>
		</div>



		<div class="people-said">
			<h1>Nói về UTC</h1>
			<div class="swiper mySwiper-1">
				<div class="swiper-wrapper">
					<c:forEach items="${about.data}" var="o">

						<div class="swiper-slide">
							<div class="so-scroll-bag">
								<div class="row">
									<div class="col-md-3">
										<div class="so-img-bag">
											<img src="${base}/uploads/${o.avatar}">
											<div class="so-img-line rounded"></div>
										</div>
									</div>
									<div class="col-md-9">
										<div class="so-scroll-div">
											<div class="so-scroll-object">${o.detail}</div>
										</div>
									</div>
								</div>
								<div class="so-info-name">
									<h6>${o.name}</h6>
									<p>${o.des}</p>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>

			</div>


			<div class="about-us">
				<h1>VỀ CHÚNG TÔI</h1>
				<div class="about-us-bag">
					<div class="row">
						<c:forEach items="${statistic.data}" var="o">
							<div class="col-md-2 about-us-bag-el">
								<p class="size-text">${o.name}</p>
								<h1>${o.data}</h1>
								<p>${o.description}</p>
							</div>
						</c:forEach>
					</div>

				</div>
			</div>




			<footer class="footer">
				<div class="container-f">
					<div class="row-f">
						<div class="footer-col">
							<h4>bộ môn- trung tâm</h4>
							<ul>
								<c:forEach items="${Department.data}" var="De">
									<li><a href="${base}/Department/${De.seo}">${De.name}</a></li>
								</c:forEach>

							</ul>
						</div>
						<div class="footer-col">
							<h4>chương trình đào tạo</h4>

							<ul>
								<c:forEach items="${programCate.data}" var="pc">
									<li><a href="${base}/category/${pc.id}">${pc.name}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="footer-col">
							<h4>Hợp tác đối ngoại</h4>
							<ul>
								<c:forEach items="${contacCate.data}" var="cc">
									<li><a href="${base}/category/${cc.id}">${cc.name}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="footer-col">
							<h4>utc.edu.vn</h4>
							<div class="social-links">
								<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
									class="fab fa-twitter"></i></a> <a href="#"><i
									class="fab fa-instagram"></i></a> <a href="#"><i
									class="fab fa-linkedin-in"></i></a>
							</div>
						</div>
					</div>
				</div>



			</footer>

			<div class="sponsor row">
				<div class="sponsor-title">
					<h1></h1>
				</div>
				<c:forEach items="${logoSponsor.data}" var="o">
					<div class="col-2">
						<img src="${base}/uploads/${o.avatar}">
					</div>
				</c:forEach>

			</div>
			<jsp:include page="/WEB-INF/views/user/layout/Footer.jsp"></jsp:include>
</html>