<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	height: 100vh;
	background-image: url('${base}/image/background-swiper.png');
	background-repeat: no-repeat;
	background-attachment: fixed;
	 background-size: 100% 100%;
}

#login .container #login-row #login-column #login-box {
	margin-top: 120px;
	max-width: 600px;
	height: 320px;
	border: 1px solid #9C9C9C;
	background-color: #EAEAEA;
}

#login .container #login-row #login-column #login-box #login-form {
	padding: 20px;
}

#login .container #login-row #login-column #login-box #login-form #register-link
	{
	margin-top: -85px;
}
</style>
</head>
<body>
	<div id="login">
		<h3 class="text-center text-white pt-5">Vui lòng đăng nhập trước
			khi truy cập trang quản lý của fit.utc</h3>
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<form action="/perform_login" class="login_form" method="POST">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<!-- kiểm tra xem đã login thành công hay không, bằng cách kiểm tra biến login_error -->
							<c:if test="${not empty param.login_error}">
								<div class="alert alert-danger" role="alert">Đăng nhập
									thất bại vui lòng thử lại</div>
							</c:if>
							<h3 class="text-center text-info">Đăng nhập</h3>
							<div class="form-group">
								<label for="username" class="text-info">Tên người dùng:</label><br>
								<input type="text" id="Username" name=username
									class="form-control">
							</div>
							<div class="form-group">
								<label for="password" class="text-info">Mật khẩu:</label><br>
								<input type="password" id="password" name="password"
									class="form-control">
							</div>
							<div class="form-group">
								<label for="remember-me" class="text-info"><span>Remember
										me</span> <span><input id="remember-me" name="remember-me"
										type="checkbox"></span></label><br> <input type="submit"
									name="submit" class="btn btn-info btn-md" value="submit">
							</div>
							<div id="register-link" class="text-right">
								<a href="#" class="text-info">Register here</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</html>