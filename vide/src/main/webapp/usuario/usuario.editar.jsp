<%@ include file="/commons/taglibs.jsp"%>
<html>
	<head>
		<title>Cadastro de Usu&aacute;rios</title>
		<%@ include file="/commons/scripts/scripts.jsp" %>
		<script>
			$(function() {
				$('#formUsuario').validate();
				onChangePapeis();
			});
		
			function salvar() {
				$('#formUsuario').submit();
			}

			function onChangePapeis(){
				var ehCliente = temOPapelCliente();
				if (ehCliente) {
					$('#clienteKey').removeAttr('disabled');
				} else {
					$('#clienteKey').attr('disabled','disabled');
				}
			}		


			function temOPapelCliente() {
				var $papel = $('#papel');
				var papeis = new String($papel.val()).split(',');
				var tem = false;
				for (p in papeis) {
					tem = tem || parseFloat(papeis[p]) == 7;
				}
				return tem;
			}

			
		</script>
	</head>
	<body>
		<form action="salvar.action" method="post" id="formUsuario">
			<ul class="info">
				<h1>Cadastro de Usu&aacute;rios</h1>
			</ul>
			<div class="group">
				<table style="width:450px;">
					<tr>
						<td>
							<b>Nome</b><br>
							<form:input path="usuario.nome" cssClass="required"/> 
							<p></p>
							
							<b>Username</b><br>
							<c:choose>
								<c:when test="${usuario.username ne null}">
									<form:hidden path="usuario.username" />
									<b>${usuario.username}</b>
								</c:when>
								<c:otherwise>
									<form:input path="usuario.username" cssClass="required" />
								</c:otherwise>
							</c:choose>		
							<p></p>
							
							<b>Senha</b><br>		
							<c:if test="${usuario.username eq null}">
								<input type="password" name="password">
							</c:if>
						</td>
						
						<td>
							<b>Pap&eacute;is</b><br>							
							<select size="5" multiple="multiple" name="papel" class="required" onchange="onChangePapeis()" id="papel">
								<c:forEach items="${papeis}" var="papel">
									<option value="${papel.papelKey}" ${usuario.mapaPapeis[papel.papelKey] ? 'selected="selected"' : ''}>${papel.descricao}</option>
								</c:forEach>
							</select>
							<p></p>		
											
						    <b>Cliente</b><br>
							<select name="clienteKey" disabled="disabled" id="clienteKey">
								<c:forEach items="${clientes}" var="cliente">
									<option value="${cliente.clienteKey}" ${usuario.cliente.clienteKey eq cliente.clienteKey ? 'selected="selected"' : ''}>${cliente.nome}</option>
								</c:forEach>
							</select>	
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td><b>email</b><br>
							<form:input path="usuario.email" size="50" cssClass="email required" />
						</td>
					</tr>
				</table>


				<div align="center">
					<button type="button" onclick="window.location.href='listar.action'">Cancelar</button>
					<button type="button" onclick="salvar()">Salvar</button><br/>
				</div>
			</div>
		</form>	
   </body>
</html>