<%@ include file="/commons/taglibs.jsp"%>
<html>
	<head>
		<title>Login Vide </title>
		<script>
			$(function() {
				$('#username').focus();
			});		
		</script>
	</head>
	<body>   
		<ul class="info"><h1> Login</h1></ul>
		<c:url var="loginUrl" value="/login.action"/>
		<h3>${mensagem}</h3>					

		<center>
		<form action="${loginUrl}" method="post">
			<table    style="width:80px;" >
				<tr>
					<td>
						<b>Username</b><br>
						<input type="text" name="username" id="username" value="${username}">
					</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>
						<b>Senha</b><br>	
						<input type="password" name="password" id="password">
					</td>				
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" >
					<td>
						<button type="submit">Login</button>
					</td>
				</tr>
			</table>
		</form>
		</center>	
</html>