<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>新規登録</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/origin/common.css">
	<style type="text/css">
		body {}
		p.left{text-align:left;}
		.birthspace{margin-left:116px;}
		.birth{width:11.5%; font size:100%;}
	</style>
</head>

<body>
	<div class="loginUser">
		<p class="userName">${userInfo.name}さん</p>
		<p class="logout"><a href="LogoutServlet">ログアウト</a></p>
	</div>

	<h1>ユーザー新規登録</h1>
	<c:if test="${errMsg != null}" >
	    <div class="alert alert-danger" role="alert">
		  ${errMsg}
		</div>
	</c:if>

	<form action="CreateServlet" method="post">
		<p>ログインID<input class="leftspace minispace" type="text" name="loginId" placeholder="login ID"></input></p>
		<p>パスワード<input class="leftspace minispace" type="password" name="password1" placeholder="password"></input></p>
		<p>パスワード(確認)<input class="leftshortspace minispace" type="password" name="password2" placeholder="password"></input></p>
		<p>ユーザー名<input class="leftspace minispace" type="text" name="userName" placeholder="user name"></input></p>
		<p>生年月日<input class="birthspace birth" type="date" name="birthDate"></input></p>
		<p><img src="picture/stamp.png" alt="ハンコ" width="100px" height="100px"></p>
		<p><input class="button btn btn-info" type="submit" value="登録"></p>
	</form>

	<p class="topspace left"><a href="BackServlet">戻る</a></p>
</body>

</html>
