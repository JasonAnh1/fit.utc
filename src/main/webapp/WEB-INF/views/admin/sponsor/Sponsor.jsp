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
    <title>Quan ly Nhà tài trợ - Đối tác</title>
    <jsp:include page="/WEB-INF/views/admin/layout/Header.jsp"></jsp:include>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="/WEB-INF/views/admin/layout/sideBar.jsp"></jsp:include>
        <div class="col-9">
            <div class="h3 mt-5">Quản lý Nhà tài trợ - Đối tác</div>

            <form action="${base}/admin/listlecturers" method="get">
                <div class="input-group rounded w-25">
                    <input type="hidden" id="page" name="page">
                    <input type="search" class="form-control rounded"
                           placeholder="Search" id="keyword" name="keyword"
                           aria-label="Search" aria-describedby="search-addon"
                           value="${sponsorSearchModel.keyword}" />
                    <button type="submit" id="btnSearch" name="btnSearch"
                            value="Search" class="btn btn-primary">Seach</button>
                </div>
                <br/>
                <table class="table">
                    <thead>
                    <tr>
                        <th>Vị trí </th>
                        <th>Avatar</th>
                        <th>Tên</th>
                        <th>Mô tả</th>
                        <th>Liên lạc</th>
                        <th>email</th>
                        <th>Đóng góp</th>
                        <th>Trạng thái</th>
                        <th>Edit</th>
                        <th>Delete</th>
                        <th>Active</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${sponsorSearch.data}" var="o"
                               varStatus="loop">
                        <tr>
                            <td>${o.index}</td>
                            <td><img src="${base}/uploads/${o.avatar}"  style="width:100%" height="100%"  alt="Image"></td>
                            <td>${o.name}</td>
                            <td>${o.description}</td>
                            <td>${o.contact}</td>
                            <td>${o.email}</td>
                            <td>${o.donated}</td>
                             <td>${o.status == true ?                '<p style="color:  #0d6efd ; font-weight: 700;">Hoạt động</p>':
                                                                                '<p style="color:#F70211; font-weight: 700;">Dừng hoạt Động</p>'}</td>
                            <td><a class="btn-info btn" href="${base}/admin/updateSponsor?cid=${o.id}">Cập nhật</a></td>
                            <td><a class="btn-danger btn" onclick="deleteSponsor(${o.id})">Xóa</a></td>
                            <td><a class="btn-success btn" onclick="activeSponsor(${o.id})">Kích hoạt</a></td>
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
            currentPage: ${sponsorSearch.currentPage},
            items: ${sponsorSearch.totalItems},
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