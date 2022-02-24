<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/user/layout/Head.jsp"></jsp:include>

<style type="text/css">
.event-news {
	padding: 10px;
	height: 500px;
	background-image: url(${base}/image/background-swiper.png);
}

.cooperation {
	background-image:
		url(${base}/image/abstract-technology-banner-with-blue-orange-lights_1017-25544.jpg);
	background-repeat: no-repeat;
	background-size: 100% 100%;
}

.admission-container {
	width: 80%;
	margin-left: 10%;
	text-align: center;
}

a {
	text-decoration: none;
	list-style-type: none;
}

.event-news a {
	color: black;
}

.event-news a:hover {
	color: gray;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/user/layout/NavBar.jsp"></jsp:include>

	<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<c:forEach items="${fourBanner.data}" var="Banner" begin="0" end="0">
				<div class="carousel-item active carousel-item-css">
					<img src="${base}/uploads/${Banner.avatar}"
						class="d-block w-100 carousel-img">
					<div class="carousel-caption carousel-caption-css">
						<h3>Chao mung ban den voi UTC</h3>
						<p>FIT UTC Tiền thân của Khoa Công nghệ Thông tin (CNTT) là Bộ
							môn Tin học, được thành lập từ đầu những năm 1988, chịu trách
							nhiệm giảng dạy các môn Tin học cho các chuyên ngành trong toàn
							Trường.</p>
						<div class="btn  btn-outline-primary ">xem thêm</div>
					</div>
					<!-- blueline -->
					<div class="horizon-navi"></div>
				</div>
			</c:forEach>
			<c:forEach items="${fourBanner.data}" var="Banner" begin="1" end="3">
				<div class="carousel-item">
					<img src="${base}/uploads/${Banner.avatar}"
						class="d-block w-100 carousel-img">
					<div class="carousel-caption carousel-caption-css">
						<h3>Chao mung ban den voi UTC</h3>
						<p>FIT UTC Tiền thân của Khoa Công nghệ Thông tin (CNTT) là Bộ
							môn Tin học, được thành lập từ đầu những năm 1988, chịu trách
							nhiệm giảng dạy các môn Tin học cho các chuyên ngành trong toàn
							Trường.</p>
						<div class="btn  btn-outline-primary ">xem thêm</div>
					</div>
					<!-- blueline -->
					<div class="horizon-navi"></div>

				</div>
			</c:forEach>
		</div>

		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>

	<div class="news">
		<h3 class="text-center pt-5">TIN MỚI NHẤT</h3>
		<!--   cards system -->
		<div class="container mt-5">
			<div class="row">
				<c:forEach items="${fourNews.data}" var="News">
					<div class="col-md-3">
						<div class="card-news-bag">
							<a href="${base }/detail/${News.seo}"> <img
								src="${base}/uploads/${News.avatar}" class="card-news" alt="..."></a>
							<h5 class="card-title">${News.title}</h5>
							<p class="card-text">${News.shortDes}</p>

						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- slide card -->


	<!--more information -->
	<div class="more-info">
		<a href="${base}/news"><h5
				style="text-align: center; color: white;">Xem thêm tin tức</h5></a>
	</div>



	<!-- Swiper JS -->
	<div class="event-news">
		<h2 class="event-news-title">Sự kiện mới nhất</h2>
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<c:forEach items="${listEvents.data}" var="Events">
					<div class="swiper-slide">
						<a href="${base}/detailE/${Events.seo}">
							<div class="event-img">
								<img src="${base}/uploads/${Events.avatar}">
							</div>
							<div class="calender-event">
								<h1>${Events.day}</h1>
								<h3>TH ${Events.month}</h3>
							</div>
							<div class="calender-event-info">
								<h2>${Events.title}</h2>
								<div class="calender-event-info-p">
									<p>Thời gian:${Events.hour}:${Events.minutes} PM</p>
									<p>Địa điểm:${Events.address}</p>
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
		<a href="${base}/ListEvents"><h5
				style="text-align: center; color: white;">Xem thêm sự kiện</h5></a>
	</div>

	<div class="admission-and-educate">
		<div class="admission-and-educate-title">
			<h2>ĐÀO TẠO – TUYỂN SINH</h2>
			<p>Năm 2020, Tổ chức Giáo dục Quacquarelli Symonds (viết tắt QS –
				Vương quốc Anh) đã đánh giá và xếp chất lượng đào tạo và nghiên cứu
				của ĐHBK Hà Nội trong các lĩnh vực mà Trường đang đảm nhận thuộc
				nhóm hạng từ 451 đến 500 trên toàn Thế giới, tiếp tục giữ vị trí số
				1 tại Việt Nam.</p>
		</div>
		<div class="admission-container">
			<div class="row">
				<c:forEach items="${twoEdu.data}" var="Edu">
					<div class="col-md-6">
					<a  href="${base }/detail/${Edu.seo}" style="color: black;">
						<figure class="admission-and-educate-img">
							<img src="${base}/uploads/${Edu.avatar}">
							<div>
								<h5>${Edu.title}</h5>
								<p>${Edu.shortDes}</p>
							</div>
							
						</figure>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>


	<div class="cooperation">
		<div class="cooperation-title">
			<h2>HỢP TÁC – ĐỐI NGOẠI</h2>
			<p>Năm 2020, Tổ chức Giáo dục Quacquarelli Symonds (viết tắt QS –
				Vương quốc Anh) đã đánh giá và xếp chất lượng đào tạo và nghiên cứu
				của ĐHBK Hà Nội trong các lĩnh vực mà Trường đang đảm nhận thuộc
				nhóm hạng từ 451 đến 500 trên toàn Thế giới, tiếp tục giữ vị trí số
				1 tại Việt Nam.</p>
		</div>
		<div class="admission-container">
			<div class="row">
				<c:forEach items="${twoContact.data}" var="Con">
					<div class="col-md-6">
					<a  href="${base }/detail/${Con.seo}" style="color: black;">
						<figure class="admission-and-educate-img">
							<img src="${base}/uploads/${Con.avatar}" class="img-fluid"
								alt="Responsive image">
							<div>
								<h5>${Con.title}</h5>
								<p>${Con.shortDes}</p>
							</div>
						</figure>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>


	</div>



	<!--cuu sinh vien -->

	<div class="alumni">
		<h1>Cựu Sinh Viên</h1>
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div class="event-img">
						<img src="../img/cuu-sv-1.jpg">
					</div>
					<div class="alumni-tag">
						<p>cựu sinh viên</p>
					</div>
					<div class="alumni-line"></div>

					<div class="alumni-text">
						<h5>Nguyễn Hồng Trường - ukii</h5>
						<p>okoke</p>
					</div>
				</div>


				<div class="swiper-slide">
					<div class="event-img">
						<img src="../img/cuu-sv-1.jpg">
					</div>
					<div class="alumni-tag">
						<p>cựu sinh viên</p>
					</div>
					<div class="alumni-line"></div>

					<div class="alumni-text">
						<h5>Nguyễn Hồng Trường - ukii</h5>
						<p>okoke</p>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="event-img">
						<img src="../img/cuu-sv-1.jpg">
					</div>
					<div class="alumni-tag">
						<p>cựu sinh viên</p>
					</div>
					<div class="alumni-line"></div>

					<div class="alumni-text">
						<h5>Nguyễn Hồng Trường - ukii</h5>
						<p>okoke</p>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="event-img">
						<img src="../img/cuu-sv-1.jpg">
					</div>
					<div class="alumni-tag">
						<p>cựu sinh viên</p>
					</div>
					<div class="alumni-line"></div>

					<div class="alumni-text">
						<h5>Nguyễn Hồng Trường - ukii</h5>
						<p>okoke</p>
					</div>
				</div>
			</div>

		</div>


		<!-- scroll bar in box -->


		<div class="people-said">
			<h1>Nói về SoUTC</h1>
			<div class="swiper mySwiper-1">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="so-scroll-bag">
							<div class="row">
								<div class="col-md-3">
									<div class="so-img-bag">
										<img src="../img/josh.png">
										<div class="so-img-line rounded"></div>
									</div>
								</div>
								<div class="col-md-9">
									<div class="so-scroll-div">
										<div class="so-scroll-object">Nhưng bất kể những lý do
											ấy, cách thức Amazon chi đậm cho mùa đầu tiên của Chúa tể của
											những chiếc nhẫn cũng thực sự gây kinh ngạc. Với khoảng 465
											triệu USD chi ra chỉ riêng cho mùa đầu tiên, công ty của tỉ
											phú Jeff Bezos gần như chắc chắn biến loạt series 5 mùa này
											thành một siêu phẩm tỉ đô, AV Club nhận định. Tờ báo giải trí
											trực tuyến của Mỹ lấy ví dụ về Game of Thrones (Trò chơi
											vương quyền) để so sánh mức độ điên rồ của Amazon trong dự án
											lần này. Theo đó, Chúa tể của những chiếc nhẫn đang mô phỏng
											Trò chơi vương quyền trên truyền hình. Theo tính toán, kể cả
											khi ném tiền vào hàng loạt cảnh chiến đấu và lâu đài hoành
											tráng trong mùa cuối, Trò chơi vương quyền cũng chỉ "ngốn"
											khoảng 15 triệu USD mỗi tập. Nói cách khác, ở mức độ bạo chi
											như hiện nay, Amazon có thể làm thêm 31 tập Trò chơi vương
											quyền tương ứng. Theo Hollywood Reporter, số tiền khổng lồ
											trên có thể đã cộng gộp luôn một lượng chi phí đáng kể 250
											triệu USD cho Tolkien Estate, đơn vị quản lý tài sản của nhà
											văn J. R. R. Tolkien, cũng như chi phí khởi động cho dự án
											phim lần này. Nhưng kể cả khi như vậy, số tiền dành cho mùa
											đầu tiên Chúa tể của những chiếc nhẫn vẫn thực sự gây kinh
											ngạc đối với dư luận. Theo Hollywood Reporter, số tiền khổng
											lồ trên có thể đã cộng gộp luôn một lượng chi phí đáng kể 250
											triệu USD cho Tolkien Estate, đơn vị quản lý tài sản của nhà
											văn J. R. R. Tolkien, cũng như chi phí khởi động cho dự án
											phim lần này. Nhưng kể cả khi như vậy, số tiền dành cho mùa
											đầu tiên Chúa tể của những chiếc nhẫn vẫn thực sự gây kinh
											ngạc đối với dư luận.</div>
									</div>
								</div>
							</div>
							<div class="so-info-name">
								<h6>josh-china</h6>
								<p>okeoke</p>
							</div>
						</div>
					</div>

					<div class="swiper-slide">
						<div class="so-scroll-bag">
							<div class="row">
								<div class="col-md-3">
									<div class="so-img-bag">
										<img src="../img/josh.png">
										<div class="so-img-line rounded"></div>
									</div>
								</div>
								<div class="col-md-9">
									<div class="so-scroll-div">
										<div class="so-scroll-object">Nhưng bất kể những lý do
											ấy, cách thức Amazon chi đậm cho mùa đầu tiên của Chúa tể của
											những chiếc nhẫn cũng thực sự gây kinh ngạc. Với khoảng 465
											triệu USD chi ra chỉ riêng cho mùa đầu tiên, công ty của tỉ
											phú Jeff Bezos gần như chắc chắn biến loạt series 5 mùa này
											thành một siêu phẩm tỉ đô, AV Club nhận định. Tờ báo giải trí
											trực tuyến của Mỹ lấy ví dụ về Game of Thrones (Trò chơi
											vương quyền) để so sánh mức độ điên rồ của Amazon trong dự án
											lần này. Theo đó, Chúa tể của những chiếc nhẫn đang mô phỏng
											Trò chơi vương quyền trên truyền hình. Theo tính toán, kể cả
											khi ném tiền vào hàng loạt cảnh chiến đấu và lâu đài hoành
											tráng trong mùa cuối, Trò chơi vương quyền cũng chỉ "ngốn"
											khoảng 15 triệu USD mỗi tập. Nói cách khác, ở mức độ bạo chi
											như hiện nay, Amazon có thể làm thêm 31 tập Trò chơi vương
											quyền tương ứng. Theo Hollywood Reporter, số tiền khổng lồ
											trên có thể đã cộng gộp luôn một lượng chi phí đáng kể 250
											triệu USD cho Tolkien Estate, đơn vị quản lý tài sản của nhà
											văn J. R. R. Tolkien, cũng như chi phí khởi động cho dự án
											phim lần này. Nhưng kể cả khi như vậy, số tiền dành cho mùa
											đầu tiên Chúa tể của những chiếc nhẫn vẫn thực sự gây kinh
											ngạc đối với dư luận. Theo Hollywood Reporter, số tiền khổng
											lồ trên có thể đã cộng gộp luôn một lượng chi phí đáng kể 250
											triệu USD cho Tolkien Estate, đơn vị quản lý tài sản của nhà
											văn J. R. R. Tolkien, cũng như chi phí khởi động cho dự án
											phim lần này. Nhưng kể cả khi như vậy, số tiền dành cho mùa
											đầu tiên Chúa tể của những chiếc nhẫn vẫn thực sự gây kinh
											ngạc đối với dư luận.</div>
									</div>
								</div>
							</div>
							<div class="so-info-name">
								<h6>josh-china</h6>
								<p>okeoke</p>
							</div>
						</div>
					</div>


					<div class="swiper-slide">
						<div class="so-scroll-bag">
							<div class="row">
								<div class="col-md-3">
									<div class="so-img-bag">
										<img src="../img/josh.png">
										<div class="so-img-line rounded"></div>
									</div>
								</div>
								<div class="col-md-9">
									<div class="so-scroll-div">
										<div class="so-scroll-object">Nhưng bất kể những lý do
											ấy, cách thức Amazon chi đậm cho mùa đầu tiên của Chúa tể của
											những chiếc nhẫn cũng thực sự gây kinh ngạc. Với khoảng 465
											triệu USD chi ra chỉ riêng cho mùa đầu tiên, công ty của tỉ
											phú Jeff Bezos gần như chắc chắn biến loạt series 5 mùa này
											thành một siêu phẩm tỉ đô, AV Club nhận định. Tờ báo giải trí
											trực tuyến của Mỹ lấy ví dụ về Game of Thrones (Trò chơi
											vương quyền) để so sánh mức độ điên rồ của Amazon trong dự án
											lần này. Theo đó, Chúa tể của những chiếc nhẫn đang mô phỏng
											Trò chơi vương quyền trên truyền hình. Theo tính toán, kể cả
											khi ném tiền vào hàng loạt cảnh chiến đấu và lâu đài hoành
											tráng trong mùa cuối, Trò chơi vương quyền cũng chỉ "ngốn"
											khoảng 15 triệu USD mỗi tập. Nói cách khác, ở mức độ bạo chi
											như hiện nay, Amazon có thể làm thêm 31 tập Trò chơi vương
											quyền tương ứng. Theo Hollywood Reporter, số tiền khổng lồ
											trên có thể đã cộng gộp luôn một lượng chi phí đáng kể 250
											triệu USD cho Tolkien Estate, đơn vị quản lý tài sản của nhà
											văn J. R. R. Tolkien, cũng như chi phí khởi động cho dự án
											phim lần này. Nhưng kể cả khi như vậy, số tiền dành cho mùa
											đầu tiên Chúa tể của những chiếc nhẫn vẫn thực sự gây kinh
											ngạc đối với dư luận. Theo Hollywood Reporter, số tiền khổng
											lồ trên có thể đã cộng gộp luôn một lượng chi phí đáng kể 250
											triệu USD cho Tolkien Estate, đơn vị quản lý tài sản của nhà
											văn J. R. R. Tolkien, cũng như chi phí khởi động cho dự án
											phim lần này. Nhưng kể cả khi như vậy, số tiền dành cho mùa
											đầu tiên Chúa tể của những chiếc nhẫn vẫn thực sự gây kinh
											ngạc đối với dư luận.</div>
									</div>
								</div>
							</div>
							<div class="so-info-name">
								<h6>josh-china</h6>
								<p>okeoke</p>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div class="about-us">
				<h1>VỀ CHÚNG TÔI</h1>
				<div class="about-us-bag">
					<div class="row">
						<div class="col-md-2 about-us-bag-el">
							<p class="size-text">QS-Ranking</p>
							<h1>000-500</h1>
							<p>trên Thế giới trong nhóm ngành Khoa học Máy tính và Hệ
								thống Thông tin</p>
						</div>
						<div class="col-md-2 about-us-bag-el">
							<p class="size-text">Sinh Viên thuộc TOP</p>
							<h1>1%</h1>
							<p>Điểm cao khối A toàn quốc mùa tuyển sinh 2019</p>
						</div>
						<div class="col-md-2 about-us-bag-el">
							<p class="size-text">Sinh viên</p>
							<h1>4000+</h1>
							<p></p>
						</div>
						<div class="col-md-2 about-us-bag-el">
							<p class="size-text">Chương trình đào tạo</p>
							<h1>17+</h1>
							<p>thuộc các hệ đào tạo cử nhân, kỹ sư, thạc sỹ khoa học,
								tiến sỹ</p>
						</div>
						<div class="col-md-2 about-us-bag-el">
							<p class="size-text">Đối tác</p>
							<h1>200+</h1>
							<p>các trường đại học, viện nghiên cứu, tập đoàn, công ty
								trong nước và quốc tế</p>
						</div>
					</div>

				</div>


			</div>









			<jsp:include page="/WEB-INF/views/user/layout/InfoBottom.jsp"></jsp:include>
</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="${base}/js/index.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setTimeout(function() {
			$(".carousel-caption-css").show();
		}, 2000);
	});
	$(document).ready(function() {
		document.getElementById("heart").onclick = function() {
			document.querySelector(".fa-gratipay").style.color = "#E74C3C";
		};
	});

	// hÃ m responsive

	function myFunction(x) {
		if (x.matches) { // If media query matches
			var swiper = new Swiper(".mySwiper", {
				slidesPerView : 1,
				spaceBetween : 30,
				slidesPerGroup : 4,
				loop : true,
				loopFillGroupWithBlank : true,
				pagination : {
					el : ".swiper-pagination",
					clickable : true,
				},
				navigation : {
					nextEl : ".swiper-button-next",
					prevEl : ".swiper-button-prev",
				},
			});

			var swiper = new Swiper(".mySwiper-1", {
				slidesPerView : 1,
				spaceBetween : 30,
				slidesPerGroup : 1,
				loop : true,
				loopFillGroupWithBlank : true,
				pagination : {
					el : ".swiper-pagination",
					clickable : true,
				},
				navigation : {
					nextEl : ".swiper-button-next-1",
					prevEl : ".swiper-button-prev-1",
				},
			});
		} else {
			var swiper = new Swiper(".mySwiper", {
				slidesPerView : 4,
				spaceBetween : 30,
				slidesPerGroup : 4,
				loop : true,
				loopFillGroupWithBlank : true,
				pagination : {
					el : ".swiper-pagination",
					clickable : true,
				},
				navigation : {
					nextEl : ".swiper-button-next",
					prevEl : ".swiper-button-prev",
				},
			});

			var swiper = new Swiper(".mySwiper-1", {
				slidesPerView : 1,
				spaceBetween : 30,
				slidesPerGroup : 1,
				loop : true,
				loopFillGroupWithBlank : true,
				pagination : {
					el : ".swiper-pagination",
					clickable : true,
				},
				navigation : {
					nextEl : ".swiper-button-next-1",
					prevEl : ".swiper-button-prev-1",
				},
			});
		}
	}

	var x = window.matchMedia("(max-width: 1000px)")
	myFunction(x) // Call listener function at run time
	x.addListener(myFunction) // Attach listener function on state changes
</script>
</html>