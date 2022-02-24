<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add categories</title>
<jsp:include page="/WEB-INF/views/admin/layout/Header.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/views/admin/layout/sideBar.jsp"></jsp:include>
			<div class="col-9">
				<h4>Thêm sự kiện</h4>
				<br>
				<sf:form class="form-horizontal" action="${base}/admin/addEvents" method="POST" modelAttribute="events" enctype="multipart/form-data" >

					<br>
					<div class="form-group">
							<label class="control-label col-sm-2">Tên sự kiện:(Không được để trống) </label>
							<div class="col-sm-10">
								<sf:input type="name" class="form-control" id="title"
									placeholder="Enter title" name="title" path="title"></sf:input>
							</div>
						</div>
						<h4>Vui lòng tham khảo lịch trước khi điền</h4>
						<div class="form-group">
							<label class="control-label col-sm-2"> Nhập ngày diễn ra sự kiện:(Không được để trống)</label>
							<div class="col-sm-10">
								<sf:input type="number" class="form-control" id="shortDes"
									placeholder="Enter day" name="shortDes" path="day"></sf:input>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2"> Nhập tháng diễn ra sự kiện:(Không được để trống nhập từ 1 đến 12)</label>
							<div class="col-sm-10">
								<sf:input type="number" class="form-control" id="shortDes"
									placeholder="Enter month" name="shortDes" path="month"></sf:input>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2"> Nhập giờ diễn ra sự kiện:(Không được để trống nhập them khung 24h)</label>
							<div class="col-sm-10">
								<sf:input type="number" class="form-control" id="shortDes"
									placeholder="Enter hour" name="shortDes" path="hour"></sf:input>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2"> Nhập phút diễn ra sự kiện:(Không được để trống nên nhập theo 15 30 phút để có hiển thị tốt nhất)</label>
							<div class="col-sm-10">
								<sf:input type="number" class="form-control" id="shortDes"
									placeholder="Enter minutes" name="shortDes" path="minutes"></sf:input>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2"> Nhập nơi (địa chỉ) diễn ra sự kiện:(Không được để trống)</label>
							<div class="col-sm-10">
								<sf:input type="text" class="form-control" id="shortDes"
									placeholder="Enter address" name="shortDes" path="address"></sf:input>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2"> Chi tiết sự kiện:(Không được để trống)</label>
							<div class="col-sm-10">
								<sf:textarea type="text" class="form-control"  id="summernote" 
									placeholder="Enter details" name="details" path="details"></sf:textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="fileProductAvatar">Avatar hiển thị trên trang chủ:</label>
							<div class="col-sm-10">
								<input id="fileNewsAvatar" name="eventsAvatar" type="file"
									class="form-control-file">
							</div>
						</div>		
						 
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<sf:button type="submit" class="btn btn-default">Submit</sf:button>
							</div>
						</div>
				</sf:form>
			</div>
		</div>

	</div>

	</div>
	<!-- Paging -->
		 <script>
    $(document).ready(function() {
        $('#summernote').summernote();
    });
  </script>
</body>
</html>