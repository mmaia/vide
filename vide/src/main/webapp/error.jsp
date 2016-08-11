<%@ page isErrorPage="true" %>
<%@ include file="/commons/taglibs.jsp"%>
<c:url var="urlSprint" value="/sprint/" />
<html>
	<head>
		<title>Oooooooooppppppsssssssss, ocorreu um erro inesperado!</title>
	</head>
	<body>
		<h1>Oooooooooppppppsssssssss, ocorreu um erro inesperado! N&atilde;o se desespere, tente novamente, se o erro persistir entre em contato com um Administrador do sistema!!!!</h1>
		<br/>
		<h3>Mensagem de erro: </h3>
		<%= exception.toString() %> 
	</body>
</html>

