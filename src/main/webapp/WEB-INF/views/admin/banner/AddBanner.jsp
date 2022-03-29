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
				<h4>Thêm Banner</h4>
				<br>
				<sf:form class="form-horizontal" action="${base}/admin/addBanner" method="POST" modelAttribute="banner" enctype="multipart/form-data" >
					<div class="form-group" hidden="">
						<label class="control-label col-sm-2" for="name">Chọn danh
							mục cha</label>
						
							<div class="col-sm-10">
								<sf:select path="categories.id" class="form-control" id="category">
								<sf:options items="${categories}" itemValue="id" itemLabel="name"/>
								</sf:select>
							
						</div>
					</div>
					<br>
					<div class="form-group">
							<label class="control-label col-sm-2">Đề mục:(Không được để trống) </label>
							<div class="col-sm-10">
								<sf:input type="name" class="form-control" id="title"
									placeholder="Enter title" name="title" path="title"></sf:input>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2"> Sapo:(Không được để trống )</label>
							<div class="col-sm-10">
								<sf:input type="text" class="form-control" id="shortDes"
									placeholder="Enter shortDes" name="shortDes" path="shortDes"></sf:input>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2"> Chi tiết nội dung:(Không được để trống)</label>
							<div class="col-sm-10">
								<sf:textarea type="text" class="form-control"  id="summernote" 
									placeholder="Enter details" name="details" path="details"></sf:textarea>
							</div>
						</div>
					<!-- 	<div class="form-group">
							<label class="control-label col-sm-2" for="fileProductPictures">Các ảnh trong bài viết(Có thể nhập nhiều ảnh):</label>
							<div class="col-sm-10">
								<input id="fileNewsPictures" name="newsPictures"
									type="file" class="form-control-file" multiple="multiple">
							</div>
						</div> -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="fileProductAvatar">Banner hiển thị trên trang chủ:</label>
							<div class="col-sm-10">
								<input id="fileNewsAvatar" name="bannerAvatar" type="file"
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