<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>ユーザー一覧</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/origin/common.css">
	<style type="text/css">
		body {}
		p.right{text-align:right;}
		.long{width:24%; font size:100%;}
		.short{width:11.5%; font size:100%;}
		.birthspace{margin-left:117px;}
		.listbutton{width:32%;}
	</style>
</head>

<body>
	<div class="loginUser">
		<p class="userName">${userInfo.name}さん</p>
		<p class="logout"><a href="LogoutServlet">ログアウト</a></p>
	</div>

	<h1>ユーザー一覧</h1>
	<c:if test="${errMsg != null}" >
	    <div class="alert alert-danger" role="alert">
		  ${errMsg}
		</div>
	</c:if>

	<form action="UserListServlet" method="post">
		<p class="right"><a href="CreateServlet"><input type="button" class="button btn btn-light" value="新規登録"></a></p>
		<p>ログインID<input class="leftspace long" name="searchLoginId" type="text" placeholder="login ID"></input></p>
		<p>ユーザー名<input class="leftspace long" name="searchName" type="text" placeholder="user name"></input></p>
		<p>生年月日<input class="birthspace short" name="searchBirthLow" type="date"></input>
			～<input class="short" name="searchBirthHigh" type="date"></p>
		<p><img src="picture/bookshelf.png" alt="一覧" width="100px" height="100px"></p>
		<p class="right"><input class="button btn btn-info" type="submit" value="検索"></p>
		<div class="container">
			<hr width="95%" color="black">
			<table class="table table-bordered">
				<tr class="table-secondary">
					<th>ログインID</th>
					<th>ユーザー名</th>
					<th>生年月日</th>
					<th></th>
				</tr>

				<c:forEach var="user" items="${userList}">
					<tr>
						<td>${user.loginId}</td>
						<td>${user.name}</td>
						<td>${user.birthDate}</td>
						<td>
							<a href="DetailServlet?id=${user.id}"><input type="button" class="listbutton btn btn-primary" value="詳細"></a>
							<c:if test = "${userInfo.loginId == 'admin' || userInfo.loginId == user.loginId}">
								<a href="UpdateServlet?id=${user.id}"><input type="button" class="listbutton btn btn-success" value="更新"></a>
							</c:if>
							<c:if test = "${userInfo.loginId == 'admin'}">
								<a href="DeleteServlet?id=${user.id}"><input type="button" class="listbutton btn btn-danger" value="削除"></a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
</body>

</html>