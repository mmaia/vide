<%@ include file="/commons/taglibs.jsp"%>
<c:url var="urlSalvarEsforco" value="/ticket/salvarEsforco.action"/>
<c:url var="urlSalvarValorDeNegocio" value="/ticket/salvarValorDeNegocio.action"/>
<c:url var="urlSalvarPar" value="/ticket/salvarPar.action"/>
<c:url var="urlSalvarBranch" value="/ticket/salvarBranch.action"/>
<html>
	<head>
		<title>Estimar ${backlog.descricao}${sprint.nome}</title>
		<script>

			$(function(){ 
				$('#formEstimativa').validate({
					errorLabelContainer: "#errorBox",
					wrapper: "li"
				});

				$("#dialog").dialog({ autoOpen: false, height: 530, width: 600, modal: true });

				recalcular();
			});

			function verDescricao(ticketKey) {
				$.ajax({
					url: 'verDescricao.action?ticketKey=' + ticketKey,
					cache: false,
					success: function (data) {
						$("#dialog").dialog('option', 'title', '#' + ticketKey + ' - ' + $('#' + ticketKey + ' .titulo').text());
						$("#dialogDescricao").html(data);
						$("#dialog").dialog('open');
					}
				});
			}
		
			function recalcular() {

				var valorDeNegocio = 0;
				$('.valorDeNegocio span').each(function(i, el){
					valorDeNegocio += parseFloat($(el).text());
				});
				$('.valorDeNegocio input[type=text]').each(function(i, el){
					valorDeNegocio += parseFloat($(el).val());
				});

				var esforco = 0;
				$('.esforco span').each(function(i, el){
					esforco += parseFloat($(el).text());
				});
				$('.esforco input[type=text]').each(function(i, el){
					esforco += parseFloat($(el).val());
				});

				$('#somaEsforco').text(esforco);
				$('#somaValorDeNegocio').text(valorDeNegocio);

			}

			function depoisDeSalvar(resposta) {
				if (!resposta == 'true') {
					alert('Ocorreu um erro e n&atilde;o foi poss&iacute;vel salvar.');
				}

			}
			
			function salvarEsforco(campo){
				var $campo = $(campo);
				var ticketKey = $campo.parents('tr').attr('id');
				var valor = $campo.val();
				$.post('${urlSalvarEsforco}', {'ticketKey':ticketKey, 'esforco' :valor}, depoisDeSalvar);
			}

			function salvarPar(campo){
				var $campo = $(campo);
				var ticketKey = $campo.parents('tr').attr('id');
				var valor = $campo.val();
				$.post('${urlSalvarPar}', {'ticketKey':ticketKey, 'par' :valor}, depoisDeSalvar);
			}

			function salvarBranch(campo){
				var $campo = $(campo);
				var ticketKey = $campo.parents('tr').attr('id');
				var valor = $campo.val();
				$.post('${urlSalvarBranch}', {'ticketKey':ticketKey, 'branch' :valor}, depoisDeSalvar);
			}

			function salvarValorDeNegocio(campo){
				var $campo = $(campo);
				var ticketKey = $campo.parents('tr').attr('id');
				var valor = $campo.val();
				$.post('${urlSalvarValorDeNegocio}', {'ticketKey':ticketKey, 'valorDeNegocio' :valor}, depoisDeSalvar);
			}
			
		</script>
	</head>
	<body>
	
		<c:choose>
			<c:when test="${sprint.nome ne null}">
				<h1>Sprint ${sprint.nome}</h1>	
			</c:when>
			<c:otherwise>
				<h1>${backlog.descricao}</h1>
			</c:otherwise>
		</c:choose>

		<div id="errorBox"></div><br/>
		<c:set var="cor" value="${true}"/>
		<c:url var="urlSalvarEstimativa" value="/ticket/salvarEstimativa.action"/>
		<form action="${urlSalvarEstimativa}" name="formEstimativa" id="formEstimativa">
			<table style="width: 100%">
				<tr>
					<th>#</th>
					<th>T&iacute;tulo</th>
					<th>Tipo</th>
					<th>Cliente</th>
					<!--  <th>Valor de Neg&oacute;cio</th> -->
					<!-- <th>Esfor&ccedil;o</th> -->
					<th>Em Par</th>
					<th>Branch</th>
					<th>Status</th>
					<th colspan="2"></th>
				</tr>
				<c:forEach items="${tickets}" var="t">
					<c:set var="cor" value="${!cor}"/>
					<tr id="${t.ticketKey}" class="${cor ? 'odd' : 'even'}">
						<td>
							${t.ticketKey}
							<input type="hidden" name="ticketKey" value="${t.ticketKey}"/>
						</td>
						<td class="titulo">${t.titulo}</td>
						<td>${t.tipoDeTicket.descricao}</td>
						<td>${t.cliente}</td>
						<!-- 
						<td class="valorDeNegocio">
							<c:choose>
								<c:when test="${usuarioLogado.productOwner}">
									<input type="text" size="5" name="valorDeNegocio" value="${t.valorDeNegocio}" onchange="recalcular();salvarValorDeNegocio(this);" class="required digits"/>
								</c:when>
								<c:otherwise>
									<span>${t.valorDeNegocio}</span>
								</c:otherwise>
							</c:choose>
						</td>
						-->
						<!-- 
						<td class="esforco">
							<c:choose>
								<c:when test="${usuarioLogado.equipe}">
									<c:choose>
										<c:when test="${empty t.filhos}">
											<input type="text" size="5" name="esforco" value="${t.esforco}" onchange="recalcular();salvarEsforco(this);" class="required number"/>
										</c:when>
										<c:otherwise>
											<input type="hidden"  name="esforco" value="${t.esforco}"/>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<span>${t.esforco}</span>
								</c:otherwise>
							</c:choose>
						</td>
						-->
						<td>
							<c:choose>
								<c:when test="${usuarioLogado.equipe}">
									<c:choose>
										<c:when test="${empty t.filhos}">
											<select name="par" onchange="salvarPar(this);">
												<option value="true" ${t.par ? 'selected' : ''}>Par</option>
												<option value="false" ${!t.par ? 'selected' : ''}>Solo</option>
											</select>
										</c:when>
										<c:otherwise>
											<input type="hidden" name="par" value="${t.par}"/>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<span>${t.descricaoPar}</span>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${usuarioLogado.equipe}">
									<c:choose>
										<c:when test="${empty t.filhos}">
											<input type="text" name="branch" value="${t.branch}" size="12" onchange="salvarBranch(this);"/>
										</c:when>
										<c:otherwise>
											<input type="hidden" name="branch" value="${t.branch}"/>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<span>${t.branch}</span>
								</c:otherwise>
							</c:choose>
						</td>
						<td>${t.kanbanStatus.descricao}</td>
						<td>
							<pronto:icons name="ver_descricao.png" title="Ver Descri&ccedil;&atilde;o" onclick="verDescricao(${t.ticketKey});"/>
						</td>
						<td>
							<a href="editar.action?ticketKey=${t.ticketKey}"><pronto:icons name="editar.png" title="Editar" /></a>
						</td>
					</tr>
					<c:forEach items="${t.filhos}" var="f">
						<c:if test="${f.backlog.backlogKey eq t.backlog.backlogKey}">
							<c:set var="cor" value="${!cor}"/>	 
							<tr class="${cor ? 'odd' : 'even'}" id="${f.ticketKey}" pai="${t.ticketKey}">
								<td>
									${f.ticketKey}
									<input type="hidden" name="ticketKey" value="${f.ticketKey}"/>
								</td>
								<td class="titulo">${f.titulo}</td>
								<td>${f.tipoDeTicket.descricao}</td>
								<td>${f.cliente}</td>
								
								<td class="valorDeNegocio">
									<c:choose>
										<c:when test="${usuarioLogado.productOwner}">
											<input type="hidden" name="valorDeNegocio" value="0" />
										</c:when>
									</c:choose>
								</td>
								<td class="esforco">
									<c:choose>
										<c:when test="${usuarioLogado.equipe}">
											<input type="text" size="5" name="esforco" value="${f.esforco}" onchange="recalcular();salvarEsforco(this);" class="required number"/>
										</c:when>
										<c:otherwise>
											<span>${f.esforco}</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${usuarioLogado.equipe}">
											<select name="par" onchange="salvarPar(this);">
												<option value="true" ${f.par ? 'selected="selected"' : ''}>Par</option>
												<option value="false" ${!f.par ? 'selected="selected"' : ''}>Solo</option>
											</select>
										</c:when>
										<c:otherwise>
											<span>${f.descricaoPar}</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${usuarioLogado.equipe}">
											<input type="text" name="branch" value="${f.branch}" size="12" onchange="salvarBranch(this);"/>
										</c:when>
										<c:otherwise>
											<span>${f.branch}</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${f.kanbanStatus.descricao}</td>
								<td>
									<pronto:icons name="ver_descricao.png" title="Ver Descri&ccedil;&atilde;o" onclick="verDescricao(${f.ticketKey});"/>
								</td>
								<td>
									<a href="editar.action?ticketKey=${f.ticketKey}"><pronto:icons name="editar.png" title="Editar" /></a>
								</td>
							</tr>
						</c:if>
					</c:forEach>
					<tr style="height: 1px;">
						<td colspan="12" style="background-color:#b4c24b"></td>
					</tr>
				</c:forEach>
				<!-- 
				<tr>
					<th colspan="4">Total</th>
					<th id="somaValorDeNegocio">
						${sprint.valorDeNegocioTotal} ${backlog.valorDeNegocioTotal}
					</th>
					<th id="somaEsforco">
						${sprint.esforcoTotal} ${backlog.esforcoTotal}
					</th>
					<th colspan="4"></th>
				</tr>
				-->
			</table>	
		
			<div align="center">
				
				<c:choose>
					<c:when test="${sprint ne null}">
						<c:url var="urlCancelar" value="/ticket/listarPorSprint.action?sprintKey=${sprint.sprintKey}"/>
					</c:when>
					<c:otherwise>
						<c:url var="urlCancelar" value="/ticket/listarPorBacklog.action?backlogKey=${backlog.backlogKey}"/>
					</c:otherwise>
				</c:choose>	
				
				<button type="button" onclick="goTo('${urlCancelar}')">Voltar</button>
			</div>
		</form>
		
		<div title="Descri&ccedil;&atilde;o" id="dialog" style="display: none; width: 500px;">
			<div align="left" id="dialogDescricao">Aguarde...</div>
		</div>
	</body>
</html>