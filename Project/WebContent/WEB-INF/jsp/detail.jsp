<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>ユーザー情報詳細</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/origin/common.css">
	<style type="text/css">
		body {}
		p.left{text-align:left;}
	</style>
</head>

<body>
	<div class="loginUser">
		<p class="userName">${userInfo.name}さん</p>
		<p class="logout"><a href="LogoutServlet">ログアウト</a></p>
	</div>

	<h1>ユーザー情報詳細</h1>
	<p class="detailA">ログインID</p>
	<p class="detailB minispace">${detail.loginId}</p>
	<p class="detailA">ユーザー名</p>
	<p class="detailB minispace">${detail.name}</p>
	<p class="detailA">生年月日</p>
	<p class="detailB minispace">${detail.birthDate}</p>
	<p class="detailA">登録日時</p>
	<p class="detailB minispace">${detail.createDate}</p>
	<p class="detailA">更新日時</p>
	<p class="detailB minispace">${detail.updateDate}</p>
	<p><img src="picture/data.png" alt="情報" width="100px" height="100px"></p>
	<p class="left"><a href="BackServlet">戻る</a></p>
</body>

</html>