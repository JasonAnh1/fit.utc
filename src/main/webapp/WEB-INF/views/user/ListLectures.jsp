<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <!-- link to CSS -->
  <link rel="stylesheet" type="text/css" href="${base}/css/header.css">
  <link rel="stylesheet" type="text/css" href="${base}/css/navbar-dropdown.css">
  <link rel="stylesheet" type="text/css" href="${base}/css/form.css">
  <link rel="stylesheet" type="text/css" href="${base}/css/lectures.css">
  <link rel="stylesheet" type="text/css" href="${base}/css/figure.css">
  <link rel="stylesheet" type="text/css" href="${base}/css/simplePagination.css">
  <!-- link to font awsome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <title>ListLectures</title>

</head>
<body>
<jsp:include page="/WEB-INF/views/user/layout/NavBar.jsp"></jsp:include>

<form action="${base}/Userlistlecturers" method="get">
<div class="container">
  <div class="link-tag">
    <a href="#">Trang chủ<i class="fas fa-angle-right"></i></a>
    <a href="${base}/Userlistlecturers">Cán bộ</a>
  </div>
  <div class="input-group rounded w-50">
    <input type="hidden" id="page" name="page">
    <input type="search" class="form-control rounded"
           placeholder="Search" id="keyword" name="keyword"
           aria-label="Search" aria-describedby="search-addon"
           value="${lecturersSearchModel.keyword}"/>
    <select
            name="departmentId" id="departmentId">
      <option value="0">all</option>
      <c:forEach items="${department}" var="department">
        <option value="${department.id}">${department.name}</option>
      </c:forEach>
    </select>
    <button type="submit" id="btnSearch" name="btnSearch"
            value="Search" class="btn btn-primary">Seach
    </button>
  </div>
</div>

<div class="container-figure">
  <c:forEach items="${lecturersSearch.data}" var="o">
    <a href="${base}/DetailLectures?cid=${o.id}">
      <figure class="figure">
        <img src="${base}/uploads/${o.avatar}" class="figure-img img-fluid rounded" alt="...">
        <figcaption class="figure-caption">${o.name}</figcaption>
      </figure>
    </a>
  </c:forEach>
</div>
</form>
</body>
<jsp:include page="/WEB-INF/views/user/layout/Footer.jsp"></jsp:include>
<script src="${base}/js/jquery.simplePagination.js" type="text/javascript" charset="utf-8" ></script>
<script type="text/javascript">
  $(document).ready(function () {
    $("#paging").pagination({
      currentPage: ${lecturersSearch.currentPage},
      items: ${lecturersSearch.totalItems},
      itemsOnPage: 5,
      cssStyle: 'dark-theme',
      onPageClick: function (pageNumber, event) {
        $('#page').val(pageNumber);
        $('#btnSearch').trigger('click');
      },
    });
  });
</script>
</html>
