<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
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
            <h4>Thêm Cựu sinh viên</h4>
            <br>
            <sf:form class="form-horizontal" action="${base}/admin/addOldStudent" method="POST" modelAttribute="oldStudent"
                     enctype="multipart/form-data">
                <sf:hidden path="id"/>
                <br>
                <div class="form-group">
                    <label class="control-label col-sm-2">Nhập họ đệm: </label>
                    <div class="col-sm-10">
                        <sf:input type="text" class="form-control" id="name"
                                  placeholder="" name="name" path="lastName"></sf:input>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2">Nhập tên: </label>
                    <div class="col-sm-10">
                        <sf:input type="text" class="form-control" id="name"
                                  placeholder="" name="name" path="firstName"></sf:input>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Nhập khoa: </label>
                    <div class="col-sm-10">
                        <sf:input type="text" class="form-control" id="name"
                                  placeholder="" name="name" path="faculty"></sf:input>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Nhập khóa: </label>
                    <div class="col-sm-10">
                        <sf:input type="text" class="form-control" id="name"
                                  placeholder="" name="name" path="aCode"></sf:input>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Nhập miêu tả: </label>
                    <div class="col-sm-10">
                        <sf:textarea type="text" class="form-control" id="summernote"
                                     placeholder="Enter details" name="tutorial" path="description"></sf:textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Nhập Số điện thoại: </label>
                    <div class="col-sm-10">
                        <sf:input type="text" class="form-control" id="name"
                                  placeholder="" name="name" path="phoneNumber"></sf:input>
                    </div>
                </div>
                <div class="form-group" style="margin-left: 8.5%">

                        <label class="control-label col-sm-1">Ngày sinh: </label>
                        <div class="col-sm-2">
                            <sf:input type="number"  class="form-control" id="name"
                                      placeholder="" name="name" path="dayOfBirth"></sf:input>
                        </div>


                        <label class="control-label col-sm-1">tháng sinh: </label>
                        <div class="col-sm-2">
                            <sf:input type="number" class="form-control" id="name"
                                      placeholder="" name="name" path="monthOfBirth"></sf:input>

                    </div>

                        <label class="control-label col-sm-1">năm sinh: </label>
                        <div class="col-sm-2">
                            <sf:input type="number" class="form-control" id="name"
                                      placeholder="" name="name" path="yearOfBirth"></sf:input>

                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Nhập công ty: </label>
                    <div class="col-sm-3">
                        <sf:input type="text" class="form-control" id="name"
                                  placeholder="" name="name" path="company"></sf:input>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Nhập email : </label>
                    <div class="col-sm-3">
                        <sf:input type="email" class="form-control" id="name"
                                  placeholder="" name="name" path="email"></sf:input>
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
    $(document).ready(function () {
        $('#summernote').summernote();
    });

</script>
</body>
</html>