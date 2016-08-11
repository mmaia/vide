<%@ include file="/commons/taglibs.jsp"%>
<html>
<head>
<title>Di&aacute;rio</title>
<%@ include file="/commons/scripts/scripts.jsp"%>
</head> 
<body>
<h1>Di&aacute;rio</h1>
<form action="listarDiario.action" id="formBuscaAvancada">
<div align="right"><input type="text" name="data" value="${data}" id="data" />
<button type="button" onclick="submit()">Pesquisar</button>
</div>
<table style="width: 100%">
	<thead>
		<tr>
			<th>Projeto/Tarefa</th>
			<th>Usu&aacute;rio</th>
			<th>Data</th>
			<th>Coment&aacute;rio</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="cor" value="${false}" />
		<c:forEach items="${ticketsComentario}" var="tc">
			<c:set var="cor" value="${!cor}" />
			<tr id="${tc.ticketComentarioKey}" class="${cor ? 'odd' : 'even'}">
				<td width="10%">${tc.ticket.titulo}</td>
				<td width="10%">${tc.usuario.nome}</td>
				<td width="10%"><fmt:formatDate value="${tc.data}"
					pattern="dd/MM/yyyy HH:mm" /></td>
				<td width="70%">${tc.texto}</td>
			</tr>
		</c:forEach>
		<hr>
		
		
		<div>
		
	
		<table style="width: 100%">
		<h1>Di&aacute;rio Scrum</h1>
			<thead>
				<tr>
					<th>Data</th>
					<th>Usu&aacute;rio</th>
					<th>Titulo</th>
					<th>Coment&aacute;rio</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="cor" value="${false}" />
				<c:forEach items="${diarios}" var="diarios">
					<c:set var="cor" value="${!cor}" />
					<tr class="${cor ? 'odd' : 'even'}">
						<td width="10%"><fmt:formatDate value="${diarios.data}"
							pattern="dd/MM/yyyy HH:mm" /></td>
						<td width="10%">${diarios.username.nome}</td>
						<td width="15%">${diarios.titulo}</td>
						<td width="65%">${diarios.comentario}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</tbody>
</table>
</body>
</html>