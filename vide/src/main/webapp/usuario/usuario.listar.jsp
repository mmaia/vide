<%@ include file="/commons/taglibs.jsp"%>
<html>
	<head>
		<title>Usu&aacute;rios</title>
		<%@ include file="/commons/scripts/scripts.jsp" %>
	</head>
	<body>
		<h1>Usu&aacute;rios</h1>
		<table style="width: 100%">
			<thead>
			<tr>
				<th colspan="2">Username</th>
				<th>Nome</th>
				<th>E-mail</th>
				<th style="width: 54px" colspan="3"></th>
			</tr>
			</thead>
			<tbody>
			<c:set var="cor" value="${true}"/>
			<c:forEach items="${usuarios}" var="u">
				
				<c:if test="${usuarioLogado.username eq u.username or usuarioLogado.administrador}">
			
				<c:set var="cor" value="${!cor}"/>
				
	            <tr style="height: 18px" class="${cor ? 'even' : 'odd'}">
  				<td style="width: 1px;"></td>
			  		
					<td>${u.username}</td>
					<td>${u.nome}</td>
					<td>${u.email}</td>
					<td>
						<c:if test="${usuarioLogado.username eq u.username or usuarioLogado.administrador}">
							<pronto:icons name="trocar_senha.png" title="Trocar Senha" onclick="goTo('digitarSenha.action?username=${u.username}')"/>
						</c:if>
					</td>
					<td>
						<c:if test="${usuarioLogado.administrador}">
							<pronto:icons name="editar_usuario.png" title="Editar Usu&aacute;rio" onclick="goTo('editar.action?username=${u.username}')"/>
						</c:if>
					</td>
					<td>
						<c:if test="${usuarioLogado.administrador}">
							<pronto:icons name="excluir_usuario.png" title="Excluir Usu&aacute;rio" onclick="goTo('excluir.action?username=${u.username}')"/>
						</c:if>
					</td>
				</tr>
				
				</c:if>
			</c:forEach>
			</tbody>
		</table>	
		
		<c:if test="${usuarioLogado.administrador}">
			<div align="center">
				<button type="button" onclick="window.location.href='editar.action'">Incluir Usu&aacute;rio</button>
			</div>
		</c:if>
	</body>
</html>