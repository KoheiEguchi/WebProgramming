<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>ログイン画面</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/origin/common.css">
	<style type="text/css">
		body{}
	</style>
</head>

<body>
	<h1 class="titlespace">ログインページ</h1>
	<c:if test="${errMsg != null}" >
	    <div class="alert alert-danger" role="alert">
		  ${errMsg}
		</div>
	</c:if>

	<form action="LoginServlet" method="post">
		<p>ログインID<input type="text" name="loginId" id="inputLoginId" class="leftspace" placeholder="login ID"></input></p>
		<p>パスワード<input type="password" name="password" id="inputPassword" class="leftspace" placeholder="password"></input></p>
		<p><img src="picture/key_lock.png" alt="確認" width="100px" height="100px"></p>
		<p><input class="button btn btn-info" type="submit" value="ログイン"></p>
	</form>
</body>

</html>