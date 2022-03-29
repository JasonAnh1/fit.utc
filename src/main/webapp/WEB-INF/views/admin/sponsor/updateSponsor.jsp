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
            <h4>Thêm Nhà tài trợ - Đối tác</h4>
            <br>
            <sf:form class="form-horizontal" action="${base}/admin/updateSponsor" method="POST" modelAttribute="sponsor" enctype="multipart/form-data" >
                <sf:hidden path="id"/>
                <br>
                <div class="form-group">
                    <label class="control-label col-sm-2">Tên Nhà tài trợ - Đối tác : </label>
                    <div class="col-sm-10">
                        <sf:input type="text" class="form-control" id="name"
                                  placeholder="" name="name" path="name"></sf:input>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Mô tả : </label>
                    <div class="col-sm-10">
                        <sf:textarea type="text" class="form-control" id="summernote1"
                                     placeholder="" name="introduce" path="description"></sf:textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Vị trí : </label>
                    <div class="col-sm-5">
                        <sf:input type="number" class="form-control" id="position"
                                  placeholder="" name="position" path="index"></sf:input>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Email : </label>
                    <div class="col-sm-10">
                        <sf:input type="text" class="form-control" id="email"
                                  placeholder="" name="email" path="email"></sf:input>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Contact: </label>
                    <div class="col-sm-10">
                        <sf:input type="text" class="form-control" id="faculty"
                                  placeholder="" name="faculty" path="contact"></sf:input>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Đóng góp</label>
                    <div class="col-sm-10">
                        <sf:textarea type="text" class="form-control"  id="summernote"
                                     placeholder="Enter details" name="scientific" path="donated"></sf:textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="sponsorAvatar">Avatar:</label>
                    <div class="col-sm-10">
                        <input id="fileNewsAvatar" name="sponsorAvatar" type="file"
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
    $(document).ready(function() {
        $('#summernote1').summernote();
    });
    $(document).ready(function() {
        $('#summernote2').summernote();
    });
    $(document).ready(function() {
        $('#summernote3').summernote();
    });
</script>
</body>
</html>