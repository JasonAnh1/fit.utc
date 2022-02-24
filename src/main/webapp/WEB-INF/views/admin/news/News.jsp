<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quan ly tin tuc</title>
<jsp:include page="/WEB-INF/views/admin/layout/Header.jsp"></jsp:include>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/views/admin/layout/sideBar.jsp"></jsp:include>
			<div class="col-9">
				<div class="h3 mt-5">Quản lý danh mục</div>

				<form action="${base}/admin/listNews" method="get">
					<div class="input-group rounded w-25">
					<input type="hidden" id="page" name="page">
						<input type="search" class="form-control rounded"
							placeholder="Search" id="keyword" name="keyword"
							aria-label="Search" aria-describedby="search-addon"
							value="${newsSearchModel.keyword}" />
						<button type="submit" id="btnSearch" name="btnSearch"
							value="Search" class="btn btn-primary">Seach</button>
					</div>
					<br/>
					<table class="table">
						<thead>
							<tr>
								<th>id</th>
								<th>Thuộc danh muc</th>
								<th>Tiêu đề</th>
								<th>Avatar</th>
								<th>Nội dung</th>
								<th>Sapo</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${newsSearch.data}" var="o"
								varStatus="loop">
								<tr>
									<td>${o.id}</td>
									<td>${o.categories.name}</td>
									<td>${o.title}</td>
									<td><img src="${base}/uploads/${o.avatar}"  style="width:100%" height="100%"  alt="Image"></td>
									<td>${o.details}</td>
									<td>${o.shortDes}</td>                             
									<td><a class="btn-info btn" href="${base}/admin/updateNews?cid=${o.id}">Cập nhật</a></td>
									<td><a class="btn-danger btn" href="${base}/admin/deleteNews?id=${o.id}">Xóa</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
						<div class="row">
		<div class="col-12 d-flex justify-content-center">
			<div id="paging"></div>
		</div>
	</div>
			</div>

		</div>

	</div>
	<!-- Paging -->

	</form>
</body>
<jsp:include page="/WEB-INF/views/admin/layout/Footer.jsp"></jsp:include>
<script type="text/javascript">
			$(document).ready(function() {
				$("#paging").pagination({
					currentPage: ${newsSearch.currentPage},
			        items: ${newsSearch.totalItems},
			        itemsOnPage: 5,
			        cssStyle: 'dark-theme',
			        onPageClick: function(pageNumber, event) {
			        	$('#page').val(pageNumber);
			        	$('#btnSearch').trigger('click');						
					},
			    });
			});
		</script>
</html>