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
<title>dashboard</title>
<jsp:include page="/WEB-INF/views/admin/layout/Header.jsp"></jsp:include>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/views/admin/layout/sideBar.jsp"></jsp:include>
			<div class="col-9">
		 <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4"></div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4"></div>
                            </div>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table mr-1"></i>
                                    Danh sách tài khoản của khách
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Fullname</th>
                                                    <th>Username</th>
                                                    <th>Password</th>
                                                    <th>Email</th>
                                                    <th>Edit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach items="${users }" var="item" varStatus="loop">
	                                           		<tr>
	                                                    <td>${loop.index + 1 }</td>
	                                                    <td>${item.fullname }</td>
	                                                    <td>${item.username }</td>
	                                                    <td>${item.password }</td>
	                                                    <td>${item.email }</td>
	                                                    <td class="d-flex "> 
	                                                        <a type="button" class="btn btn-primary" href="#">Update</a>
	                                                        <button type="button" class="btn btn-danger remove ml-1">Remove</button>
	                                                    </td>
	                                                </tr> 
                                            	</c:forEach>
                                                                                           
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

			</div>

		</div>

	</div>
</body>
<jsp:include page="/WEB-INF/views/admin/layout/Footer.jsp"></jsp:include>
<!-- <script type="text/javascript">
			$(document).ready(function() {
				$("#paging").pagination({
					currentPage: ${bannerSearch.currentPage},
			        items: ${bannerSearch.totalItems},
			        itemsOnPage: 5,
			        cssStyle: 'dark-theme',
			        onPageClick: function(pageNumber, event) {
			        	$('#page').val(pageNumber);
			        	$('#btnSearch').trigger('click');						
					},
			    });
			});
		</script> -->
</html>