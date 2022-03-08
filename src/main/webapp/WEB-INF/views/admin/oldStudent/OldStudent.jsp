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
            <div class="h3 mt-5">Quản lý cựu sinh viên</div>

            <form action="${base}/admin/listOldStudent" method="get">
                <div class="input-group rounded w-25">
                    <input type="hidden" id="page" name="page">
                    <input type="search" class="form-control rounded"
                           placeholder="Search" id="keyword" name="keyword"
                           aria-label="Search" aria-describedby="search-addon"
                           value="${oldStudentSearchModel.keyword}" />
                    <button type="submit" id="btnSearch" name="btnSearch"
                            value="Search" class="btn btn-primary">Seach</button>
                </div>
                <br/>
                <table class="table">
                    <thead>
                    <tr>
                        <th>số thứ tự</th>
                        <th>Tên cựu sinh viên</th>
                        <th>Khoa</th>
                        <th>Khóa</th>
                        <th>Công ty</th>
                        <th>Email</th>
                        <th>Sdt</th>
                        <th>Thông tin chung</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${oldStudentSearch.data}" var="o"  varStatus="loop">
                        <tr>
                            <td>${loop.count}</td>
                            <td>${o.lastName}&nbsp${o.firstName}</td>
                            <td>${o.faculty}</td>
                            <td>${o.aCode}</td>
                            <td>${o.company}</td>
                            <td>${o.email}</td>
                            <td>${o.phoneNumber}</td>
                            <td>${o.description}</td>
                            <td><a class="btn-info btn" href="${base}/admin/updateForm?cid=${o.id}">Cập nhật</a></td>
                            <td><a class="btn-danger btn" href="${base}/admin/deleteForm?id=${o.id}">Xóa</a></td>

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

</div>
<!-- Paging -->

</form>
</body>
<jsp:include page="/WEB-INF/views/admin/layout/Footer.jsp"></jsp:include>
<script type="text/javascript">
    $(document).ready(function() {
        $("#paging").pagination({
            currentPage: ${oldStudentSearch.currentPage},
            items: ${oldStudentSearch.totalItems},
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