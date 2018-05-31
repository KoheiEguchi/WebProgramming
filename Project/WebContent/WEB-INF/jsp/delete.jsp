<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>ユーザー削除</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/origin/common.css">
	<style type="text/css">
		body {}
		.check{font-size:x-large; color:#ff0000}
	</style>
</head>

<body>
	<div class="loginUser">
		<p class="userName">${userInfo.name}さん</p>
		<p class="logout"><a href="LogoutServlet">ログアウト</a></p>
	</div>

	<h1>ユーザー削除確認</h1>
	<c:if test="${errMsg != null}" >
	    <div class="alert alert-danger" role="alert">
		  ${errMsg}
		</div>
	</c:if>

	<form action="DeleteServlet" method="post">
		<input type="hidden" name="id" value="${detail.id}">
		<p>ログインID:<span class="check">${detail.loginId}</span></p>
		<p>を本当に<span class="check"><b>削除</b></span>してよろしいでしょうか。</p>
		<p><img src="picture/alert.png" alt="注意" width="100px" height="100px"></p>
		<p><a href="BackServlet"><input class="btn btn-info btn-lg deleteCancel" type="button" value="キャンセル"></a></p>
		<p><input class="btn btn-danger deleteOk" type="submit" value="OK"></p>
	</form>
</body>

</html>