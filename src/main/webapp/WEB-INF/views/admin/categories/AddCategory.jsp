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
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/views/admin/layout/sideBar.jsp"></jsp:include>
			<div class="col-9">
				<h4>Thêm mới danh mục</h4>
				<br>
				<sf:form class="form-horizontal" action="${base}/admin/addCategories" method="POST" modelAttribute="category">
					<div class="form-group">
						<label class="control-label col-sm-2" for="name">Chọn danh
							mục cha</label>
						
							<div class="col-sm-10">
								<sf:select path="parent.id" class="form-control" id="category">
								<sf:options items="${listcate}" itemValue="id" itemLabel="name"/>
								</sf:select>
							
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class="control-label col-sm-2" for="name">Nhập danh
							mục</label>
						<div class="col-sm-10">
							<sf:input type="text" class="form-control" id="name" name="name"
								placeholder="Nhập tên thư mục" path="name"></sf:input>
						</div>
					</div>
					<br>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<sf:button type="submit" class="btn btn-danger">Submit</sf:button>
						</div>
					</div>
				</sf:form>
			</div>
		</div>

	</div>

	</div>
	<!-- Paging -->

</body>
</html>