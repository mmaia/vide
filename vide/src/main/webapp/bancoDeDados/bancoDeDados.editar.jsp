<%@ include file="/commons/taglibs.jsp"%>
<html>
	<head>
		<title>Scripts</title>
		<script type="text/javascript">

		function voltar() {
			goTo('listar.action');
		}

		function salvar() {
			 $('#form').submit();
		}

		$(function() {
			  $('#form').validate();
			  $('input[name=nome]').get(0).focus();
		});
		
		</script>
	</head>
	<body>
		<h1> ${bancoDeDados.bancoDeDadosKey eq 0 ? 'Incluir' : 'Editar'} Banco de Dados </h1>
		
		<form action="salvar.action" method="post" id="form">
			<form:hidden path="bancoDeDados.bancoDeDadosKey"/>
			
			<div class="group">
					
				<div>
					<form:input path="bancoDeDados.nome"/>
					<p>Descri&ccedil;&atilde;o</p>
				</div>
				
				<div align="center">
					<button type="button" onclick="voltar()">Cancelar</button>
					<button type="button" onclick="salvar()">Salvar</button><br/>
				</div>
			</div>
		</form>		
		
	</body>
</html>