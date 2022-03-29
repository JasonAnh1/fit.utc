<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 16/03/2022
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- link to CSS -->
    <link rel="stylesheet" type="text/css" href="${base}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${base}/css/navbar-dropdown.css">
    <link rel="stylesheet" type="text/css" href="${base}/css/lectures.css">
    <link rel="stylesheet" type="text/css" href="${base}/css/link-tag.css">
    <link rel="stylesheet" type="text/css" href="${base}/css/lecture-info.css">

    <!-- link to font awsome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
          integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <title>Detail Lectures</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/user/layout/NavBar.jsp"></jsp:include>

<div class="container">
    <div class="link-tag">
        <a href="${base}/index">Trang chủ<i class="fas fa-angle-right"></i></a>
        <a href="${base}/Userlistlecturers">Cán bộ<i class="fas fa-angle-right"></i></a>
        <a>${lecturer.name}</a>
    </div>

    <div class="container-info row">
        <div class="container-info-img col-5">
            <div class="lectures-information">
                <img src="${base}/uploads/${lecturer.avatar}" class="lecture-image">
                <h2>${lecturer.name}</h2>
                <h6>${lecturer.position}</h6>
                <p>Email: &nbsp ${lecturer.email}</p>
                <p>Khoa: &nbsp ${lecturer.faculty}</p>
            </div>
            <div class="lectures-information">
                <h2>Lĩnh Vực Nghiên Cứu</h2>
                <div class="blue-line"></div>
                <ul>
                    <br>
                    <p>${lecturer.research}</p>
                </ul>
            </div>


        </div>
        <div class="container-info-img col-7">
            <div class="lectures-introduce">
                <h2>Giới Thiệu</h2>
                <div class="blue-line"></div>
                <br>
                <p>${lecturer.introduce}</p>
            </div>
            <div class="lectures-introduce">
                <h2>Giảng dạy</h2>
                <div class="blue-line"></div>
                <ul>
                    <br>
                    <p>${lecturer.teaching}</p>
                </ul>
            </div>
            <div class="lectures-introduce">
                <h2>Các nghiên cứu khoa học</h2>
                <div class="blue-line"></div>
                <ul>
                    <br>
                    <p>${lecturer.scientific}</p>
                </ul>
            </div>
        </div>

</body>
</html>
