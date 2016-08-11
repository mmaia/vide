<%@ include file="/commons/taglibs.jsp"%>
<c:url var="detalhesUrl" value="/ticket/verDescricao.action"/>
<c:url var="urlAlterarOrdem" value="/cliente/priorizar.action"/>

<html>
	<head>
		<title>Backlog</title>
		<%@ include file="/commons/scripts/scripts.jsp" %>
		<script>
			function verDescricao(ticketKey) {
				$.ajax({
					url: '${detalhesUrl}?ticketKey=' + ticketKey,
					cache: false,
					success: function (data) {
						$("#dialog").dialog('option', 'title', '#' + ticketKey + ' - ' + $('#' + ticketKey + ' .titulo').text());
						$("#dialogDescricao").html(data);
						$("#dialog").dialog('open');
					}
				});
			}
	
			$(function() {
				$("#dialog").dialog({ autoOpen: false, height: 530, width: 600, modal: true });

				$("#pendentes tbody").sortable({
    				placeholder: 'ui-state-highlight',
    				stop: alterarPrioridadeDaTarefa,
    				items: 'tr'
    		  	});
				
			});

			function alterarPrioridadeDaTarefa() {
				var $pendentes = $('#pendentes tr');
				var novaOrdem = new Array($pendentes.length);
				var indice = 0;
				$pendentes.each(function(i, el) {
					novaOrdem[indice++] = el.id;
				});

				$.post('${urlAlterarOrdem}', { 'ticketKey': novaOrdem, 'clienteKey':${cliente.clienteKey} });
			}
		</script>
	</head>
	<body>
	
		<h1>Backlog</h1>
		<h2>Solicita&ccedil;&otilde; es Pendentes</h2>
		
		<span>Arraste e solte as linhas da tabela para priorizar as solicita&ccedil;&otilde; es.</span>
		
		<table style="width: 100%" id="pendentes">
			<thead>
			<tr>
				<th>#</th>
				<th>T&iacute;tulo</th>
				<th>Solicitador</th>
				<th>Data</th>
				<th style="width: 16px"></th>
			</tr>
			</thead>
			<tbody>
			<c:set var="cor" value="${true}"/>
			<c:forEach items="${tickets}" var="t">
				<c:if test="${!t.done}">
					<c:set var="cor" value="${!cor}"/>
					<tr id="${t.ticketKey}" class="${cor ? 'odd' : 'even'}">
						<td>${t.ticketKey}</td>	
						<td class="titulo">${t.titulo}</td>
						<td>${t.solicitador}</td>
						<td><fmt:formatDate value="${t.dataDeCriacao}"/></td>
						<td>
							<pronto:icons name="ver_descricao.png" title="Ver Descri&ccedil;&atilde; o" onclick="verDescricao(${t.ticketKey});"/>
						</td>
					</tr>
				</c:if>
			</c:forEach>
			</tbody>
		</table>	
		
		<h2>Solicita&ccedil;&otilde; es Prontas</h2>
		<table style="width: 100%">
			<thead>
			<tr>
				<th>#</th>
				<th class="titulo">T&iacute;tulo</th>
				<th>Solicitador</th>
				<th>Data da Solicita&ccedil;&atilde;o</th>
				<th>Data da Entrega</th>
				<th style="width: 16px"></th>
			</tr>
			</thead>
			<tbody>
			<c:set var="cor" value="${true}"/>
			<c:forEach items="${tickets}" var="t">
				<c:if test="${t.done}">
					<c:set var="cor" value="${!cor}"/>
					<tr id="${t.ticketKey}" class="${cor ? 'odd' : 'even'}">
						<td>${t.ticketKey}</td>	
						<td class="titulo">${t.titulo}</td>
						<td>${t.solicitador}</td>
						<td><fmt:formatDate value="${t.dataDeCriacao}"/></td>
						<td><fmt:formatDate value="${t.dataDePronto}"/></td>
						<td>
							<pronto:icons name="ver_descricao.png" title="Ver Descri&ccedil;&atilde;o" onclick="verDescricao(${t.ticketKey});"/>
						</td>
					</tr>
				</c:if>
			</c:forEach>
			</tbody>
		</table>	
		
		<div title="Descri&ccedil;&atilde; o" id="dialog" style="display: none; width: 500px;">
			<div align="left" id="dialogDescricao">Aguarde...</div>
		</div>
		
	</body>
</html>