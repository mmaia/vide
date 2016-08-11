<%@ include file="/commons/taglibs.jsp"%>
<html>
<head>
<title>Di&aacute;rio</title>
<%@ include file="/commons/scripts/scripts.jsp"%>
<script>
		  $(function() {
		      $("#comentario").markItUp(mySettings);
	       });
</script> 

</head>
<body>
<h1>Di&aacute;rio Scrum</h1>
<form action="salvarDiario.action" id="formSalvarDiario" method="post">
<div align="left">
	<h3>T&iacute;tulo</h3>
	<form:input path="diario.titulo" size="100%" id="titulo" cssClass="required"/> 
	<br><br>	
	<h3>Coment&aacute;rio</h3>
	<form:textarea path="diario.comentario" id="comentario"/>
	<br>
</div>
<div align="left">
	<button  type="submit">Salvar</button>
</div>
<br><br>

<table style="width: 100%">
	<thead>
		<tr>
			<th>Data</th>
			<th>Titulo</th>
			<th>Coment&aacute;rio</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="cor" value="${false}" />
		<c:forEach items="${diarios}" var="diarios">
			<c:set var="cor" value="${!cor}" />
			<tr  class="${cor ? 'odd' : 'even'}">
				<td width="10%"> 
				    <fmt:formatDate value="${diarios.data}"	pattern="dd/MM/yyyy HH:mm" />
				</td>
			   <td width="20%">${diarios.titulo}</td>
			   <td width="70%">${diarios.comentario}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>