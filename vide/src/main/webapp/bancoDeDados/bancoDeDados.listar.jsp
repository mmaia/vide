<%@ include file="/commons/taglibs.jsp"%>
<c:url var="listarExecucoesUrl" value="/execucao/listar.action"/>
<c:url var="listarScriptsUrl" value="/script/listar.action"/>
<html>
	<head>
		<title>Bancos de Dados</title>
		<script type="text/javascript">

			function incluir(){
				goTo('incluir.action');
			}

			function excluir(bancoDeDadosKey){
				if (confirm('Tem certeza que deseja excluir este banco de dados? Todos as execu&ccedil;&atilde;es de scripts associadas a ele ser�o exclu�das.')) {
					goTo('excluir.action?bancoDeDadosKey=' + bancoDeDadosKey);
				}
			}
		
		</script>
	</head>
	<body>
		<h1>
			Bancos de Dados
			<pronto:icons name="script.png" title="Ver Scripts" onclick="goTo('${listarScriptsUrl}')"/>
			<pronto:icons name="execucao.png" title="Ver Execu&ccedil;&atilde;es de Todos os Bancos de Dados" onclick="goTo('${listarExecucoesUrl}')"/>
		</h1>
		<c:set var="cor" value="${true}"/>
		<table style="width: 100%">
			<tr>
				<th style="width: 20px;">#</th>
				<th>Nome</th>
				<th style="width: 16px;"></th>
				<th style="width: 16px;"></th> 
				<th style="width: 16px;"></th>
			</tr>
			<c:forEach items="${bancos}" var="b">
				<c:set var="cor" value="${!cor}"/>
				
				<tr id="${b.bancoDeDadosKey}" class="${cor ? 'odd' : 'even'}">
					<td>${b.bancoDeDadosKey}</td>
					<td class="descricao">${b.nome}</td>
					<td>
						<pronto:icons name="execucao.png" title="Ver Execu&ccedil;&atilde;es do Banco de Dados ${b.nome}" onclick="goTo('${listarExecucoesUrl}?bancoDeDadosKey=${b.bancoDeDadosKey}')"/>
					</td>
					<td>
						<a href="editar.action?bancoDeDadosKey=${b.bancoDeDadosKey}"><pronto:icons name="editar_banco_de_dados.png" title="Editar" /></a>
					</td>
					<td>
						<a href="#"><pronto:icons name="excluir_banco_de_dados.png" title="Excluir" onclick="excluir(${b.bancoDeDadosKey})"/></a>
					</td>
				</tr>
			</c:forEach>
		</table>	
		
		<div align="center">
			<button onclick="incluir()">Incluir</button>
		</div>
		
	</body>
</html>

