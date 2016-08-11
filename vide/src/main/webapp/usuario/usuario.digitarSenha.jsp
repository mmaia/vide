<%@ include file="/commons/taglibs.jsp"%>
<html>
	<head>
		<title>Troca de Senha</title>
		<%@ include file="/commons/scripts/scripts.jsp" %>
		<script>

			$(function() {
				$('#password').focus();
				$('#formUsuario').validate();
			});
		
			function salvar() {
				$('#formUsuario').submit();
			}		
		</script>
	</head>
	<body>
		<form action="trocarSenha.action" method="post" id="formUsuario">
			<ul class="info">
				<h1>Troca de Senha</h1>
			</ul>
			<div class="group">
				<form:hidden path="usuario.username"/>
				<div>
					<b>${usuario.username}</b>
					<p>Username</p>
				</div>
				<div>
					<b>${usuario.nome}</b>
					<p>Nome</p>
				</div>
				<!-- COMENTADO POIS NÃO ESTA SENDO UTILIZADO AINDA 
				<div>
					<p><img alt="Gravatar" align="top" title="Gravatar - Globally Recognized Avatars" src="http://www.gravatar.com/avatar/${usuario.emailMd5}" /></p>
					<p>Gravatar</p>
				</div>
				<div>
				-->
					<input type="password" name="password" id="password" class="required">
					<p>Nova Senha</p>
				</div>
				<div align="center">
					<button type="button" onclick="window.location.href='listar.action'">Cancelar</button>
					<button type="button" onclick="salvar()">Confirmar</button><br/>
				</div>
			</div>
		</form>		
	</body>
</html>