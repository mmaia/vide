<%@ include file="/commons/taglibs.jsp"%>
<c:url var="urlAlterarOrdem" value="/ticket/alterarOrdemDasTarefas.action"/>
<html>
	<head>
		<title><c:choose><c:when test="${ticket.ticketKey gt 0}">${ticket.tipoDeTicket.descricao} #${ticket.ticketKey}</c:when><c:otherwise>Incluir ${ticket.tipoDeTicket.descricao}</c:otherwise></c:choose></title>
		<script>

		function alterarDesenvolvedores() {
			$('.desenvolvedor').css('display','inline');
		}

		function alterarTestadores() {
			$('.testador').css('display','inline');
		}
		
		function toogleDesenvolvedor(username){
			var $imagem = $('#dev_img_'+username);
			var $campo = $('#dev_chk_'+username);
			
			if ($imagem.hasClass('ativo')) {
				$imagem.removeClass('ativo');
				$imagem.addClass('inativo');
				$campo.removeAttr('checked');
			} else {
				$imagem.removeClass('inativo');
				$imagem.addClass('ativo');
				$campo.attr('checked','checked');
			}
		}

		function toogleTestador(username){
			var $imagem = $('#tes_img_'+username);
			var $campo = $('#tes_chk_'+username);
			
			if ($imagem.hasClass('ativo')) {
				$imagem.removeClass('ativo');
				$imagem.addClass('inativo');
				$campo.removeAttr('checked');
			} else {
				$imagem.removeClass('inativo');
				$imagem.addClass('ativo');
				$campo.attr('checked','checked');
			}
		}

		 var alterarPrioridadeDaTarefa = function(ui, event) {

				var $tarefas = $('#tarefas li');
				var novaOrdem = new Array($tarefas.length);
				var indice = 0;
				$tarefas.each(function(i, el) {
					novaOrdem[indice++] = el.id;
				});

				$.post('${urlAlterarOrdem}', { 'ticketKey': novaOrdem, 'pai': ${ticket.ticketKey} });
			};
		
		$(function() {
			  $('#formTicket').validate();
		      $("#descricao").markItUp(mySettings);
		      $("#comentario").markItUp(mySettings);
		      $("#titulo").focus();

    		  $("#dialog").dialog({ autoOpen: false, height: 530, width: 600, modal: true });

    		  $("#tarefas").sortable({
    				placeholder: 'ui-state-highlight',
    				stop: alterarPrioridadeDaTarefa 
    		  });
    		  $("#tarefas").disableSelection();
		 });

		
		 

		 function excluirAnexo(ticketKey, anexo) {
			if (confirm('Tem certeza que deseja excluir este anexo?')) {
				goTo('excluirAnexo.action?ticketKey=' + ticketKey+ '&file=' + anexo);
			}
		 }

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
		</script>
		<style>
			#tarefas { list-style-type: none; margin: 0; padding: 0; width: 60%; }
			#tarefas li { margin: 0 5px 5px 5px; padding: 2px; height: 1.5em; font-size: 12px}
			html>body #tarefas li { height: 1.5em; line-height: 1.2em; }
			.ui-state-highlight { height: 1.5em; line-height: 1.2em; }
			.ui-state-default { background-image: none; background-color: #f8f8f8; color: #0066cc; }
		</style>
	</head>
	<body>
		
		<c:choose>
			<c:when test="${ticket.ticketKey gt 0}">
				<h1>${ticket.tipoDeTicket.descricao} #${ticket.ticketKey} - ${ticket.titulo} (${ticket.kanbanStatus.descricao})</h1>
			</c:when>
			<c:otherwise>
				<h1>Incluir ${ticket.tipoDeTicket.descricao}</h1>
			</c:otherwise>
		</c:choose>

		<c:if test="${ticket.ticketKey gt 0}">
			<!-- Operacoes -->
			<c:if test="${ticket.pai ne null and ticket.ticketKey gt 0}">
				<a href="editar.action?ticketKey=${ticket.pai.ticketKey}"><pronto:icons name="estoria.png" title="Ir para Projeto" /></a>
			</c:if>
			<c:if test="${ticket.tipoDeTicket.tipoDeTicketKey eq 2}">
				<pronto:icons name="transformar_em_bug.png" title="Transformar em Defeito" onclick="goTo('transformarEmDefeito.action?ticketKey=${ticket.ticketKey}')"></pronto:icons>
			</c:if>
			<c:if test="${ticket.tipoDeTicket.tipoDeTicketKey eq 3}">
				<pronto:icons name="transformar_em_estoria.png" title="Transformar em Projeto" onclick="goTo('transformarEmEstoria.action?ticketKey=${ticket.ticketKey}')"></pronto:icons>
			</c:if>
			<c:if test="${(ticket.backlog.backlogKey eq 1 or ticket.backlog.backlogKey eq 3) and usuarioLogado.productOwner and !ticket.tarefa}">
					<pronto:icons name="mover_para_pb.png" title="Mover para o Product Backlog" onclick="goTo('moverParaProductBacklog.action?ticketKey=${ticket.ticketKey}')"></pronto:icons>
			</c:if>
			<c:if test="${ticket.backlog.backlogKey eq 2 and !ticket.tarefa}">
					<pronto:icons name="mover_para_ideias.png" title="Mover para o Backlog de Ideias" onclick="goTo('moverParaIdeias.action?ticketKey=${ticket.ticketKey}')"></pronto:icons>
			</c:if>
			<c:if test="${(ticket.backlog.backlogKey eq 1 or ticket.backlog.backlogKey eq 2) and usuarioLogado.productOwner}">
				<pronto:icons name="lixeira.png" title="Mover para a Lixeira" onclick="goTo('jogarNoLixo.action?ticketKey=${ticket.ticketKey}')"></pronto:icons>
			</c:if>
			<c:if test="${ticket.backlog.backlogKey eq 1 or (ticket.backlog.backlogKey eq 2 and usuarioLogado.productOwner) or ticket.backlog.backlogKey eq 3}">
				<pronto:icons name="impedimento.png" title="Mover para Impedimentos" onclick="goTo('moverParaImpedimentos.action?ticketKey=${ticket.ticketKey}')"></pronto:icons>
			</c:if>
			<c:if test="${(ticket.backlog.backlogKey eq 2 and usuarioLogado.productOwner)}">
				<pronto:icons name="mover_para_o_sprint_atual.png" title="Mover para o Sprint Atual" onclick="goTo('moverParaOSprintAtual.action?ticketKey=${ticket.ticketKey}')"></pronto:icons>
			</c:if>
			<c:if test="${ticket.backlog.backlogKey eq 4 or ticket.backlog.backlogKey eq 5}">
				<c:if test="${!ticket.tarefa or (ticket.tarefa && ticket.pai.backlog.backlogKey ne 4 && ticket.pai.backlog.backlogKey ne 5)}">
					<pronto:icons name="restaurar.png" title="Restaurar" onclick="goTo('restaurar.action?ticketKey=${ticket.ticketKey}')"></pronto:icons>
				</c:if>
			</c:if>
			<c:if test="${ticket.tipoDeTicket.tipoDeTicketKey eq 2 and ticket.backlog.backlogKey ne 1}">
				<pronto:icons name="nova_tarefa.png" title="Incluir Tarefa" onclick="goTo('incluirTarefa.action?paiKey=${ticket.ticketKey}')"></pronto:icons>
			</c:if>
			<c:if test="${ticket.tipoDeTicket.tipoDeTicketKey eq 6 and ticket.backlog.backlogKey ne 1}">
				<pronto:icons name="nova_tarefa.png" title="Incluir Tarefa" onclick="goTo('incluirTarefa.action?paiKey=${ticket.pai.ticketKey}')"></pronto:icons>
			</c:if>
			<!-- Fim das Operacoes -->
			<br/><br/>
			
			<h3>Descri&ccedil;&atilde;o</h3>
			<div class="htmlbox">
				${ticket.html}
			</div>
		</c:if>
	
		
		<c:if test="${!empty ticket.comentarios}">
			<h3>Coment&aacute;rios</h3>
			<c:forEach items="${ticket.comentarios}" var="comentario">
				<div class="htmlbox" style="position: relative;">
					<div align="right" style="size: 8px; color: #0066cc;"><i>Por ${comentario.usuario} em <fmt:formatDate value="${comentario.data}" type="both"/></i></div>
					<img alt="BB" align="left" title="BB" src="../commons/images/bb.gif" style="float: right; display: block; margin-top: 15px;"/>
					<div style="margin-right: 62px">${comentario.html}</div>
				</div>
			</c:forEach>
			<br/>
		</c:if>
			
			
		<form action="salvar.action" method="post" id="formTicket">
			<form:hidden path="ticket.tipoDeTicket.tipoDeTicketKey" />
			<c:if test="${ticket.ticketKey gt 0}">
				<form:hidden path="ticket.ticketKey"/>
			</c:if>
			
			<c:if test="${!empty ticket.filhos}">
				<h3>Tarefas</h3>
				<ul style="width: 100%; font-size: 12px;" id="tarefas">
					<c:forEach items="${ticket.filhos}" var="filho">
						<li class="ui-state-default" id="${filho.ticketKey}">
							<span style="float: left;">
								<b>${filho.ticketKey}</b>
								<span class="titulo">${filho.titulo}</span>
							</span>
							<span style="float: right;">
								<pronto:icons name="ver_descricao.png" title="Ver Descri&ccedil;&atilde;o" onclick="verDescricao(${filho.ticketKey});"/>
								<a href="editar.action?ticketKey=${filho.ticketKey}"><pronto:icons name="editar.png" title="Editar" /></a>
							</span>
						</li>
					</c:forEach>
				</ul>
			</c:if>
				
			<div class="group">
				
				<div>
					<form:hidden path="ticket.backlog.backlogKey"/>
					<b>${ticket.backlog.descricao} - Backlog</b>					
					<p></p>
				</div>
			<!-- 	
				<c:if test="${ticket.backlog.backlogKey eq 3}">
					<c:choose>
						<c:when test="${!ticket.tarefa and !(ticket.sprint ne null and ticket.sprint.fechado)}">
							<form:select path="ticket.sprint.sprintKey">
								<form:options items="${sprints}" itemLabel="nome" itemValue="sprintKey"/>
							</form:select>
							<p>Sprint</p>
						</c:when>
						<c:otherwise>
							<form:hidden path="ticket.sprint.sprintKey"/>
							<b>${ticket.sprint.nome}</b>
							<p>Sprint</p>
						</c:otherwise>
					</c:choose>
				</c:if>
			 -->	
				<c:if test="${ticket.pai ne null}">
					<input type="hidden" name="paiKey" value="${ticket.pai.ticketKey}"/>
					<c:if test="${ticket.ticketKey gt 0}">
						<a href="editar.action?ticketKey=${ticket.pai.ticketKey}"><pronto:icons name="estoria.png" title="Ir para Projeto" /></a>
					</c:if>
					<b>#${ticket.pai.ticketKey} - ${ticket.pai.titulo}</b>
					<p>Projeto</p>
				</c:if>
				


				<table style="width:710px;">
				       <tr>
				       		<td><b>T&iacute;tulo</b></td>
					   </tr>
					   <tr>
					   		<td><form:input path="ticket.titulo" size="100%" id="titulo" cssClass="required"/></td>
					   </tr>		
				</table>
				
				
				<table style="width:710px;">	 
					<tr>
						<td>
							<b>Cliente</b><br>
						    <c:choose>
								<c:when test="${!ticket.tarefa}">
									<select name="clienteKey" id="clienteKey">
									<c:forEach var="c" items="${clientes}">
										<c:choose>
											<c:when test="${c.clienteKey eq ticket.cliente.clienteKey}">
												<option value="${c.clienteKey}" selected="selected">${c.nome}</option>	
											</c:when>
											<c:otherwise>
												<option value="${c.clienteKey}">${c.nome}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>							
									</select>
								</c:when>
							<c:otherwise>
								<input type="hidden" name="clienteKey" value="${ticket.cliente.clienteKey}" />
								<b>${ticket.cliente eq null ? '-' : ticket.cliente.nome}							
							</c:otherwise>
							</c:choose>
						</td>
					    <td>
					    	<b>Solicitador</b><br>
							<c:choose>
								<c:when test="${!ticket.tarefa}">
									<form:input path="ticket.solicitador" cssClass="required" />
									<br />
								</c:when>
								<c:otherwise>
									<form:hidden path="ticket.solicitador" />
									<b>${ticket.solicitador eq null ? '-' : ticket.solicitador}
								</c:otherwise>
							</c:choose>
						</td>
						<td>
						    <b>Data de Pronto</b><br>
							<form:input path="ticket.dataDePronto"/>
						</td>
						<td>	
							<b>Planejado ?</b><br>
							<form:select path="ticket.planejado">
								<form:option value="true">Sim</form:option>
								<form:option value="false">N&atilde;o</form:option>
							</form:select>
						</td>   
					</tr>			
				</table>
				
			    <table style="width:710px;">
					<tr>						
						<td>
							<b>Kanban Status</b><br>
							<form:select path="ticket.kanbanStatus.kanbanStatusKey">
								<form:options items="${kanbanStatus}" itemLabel="descricao"
									itemValue="kanbanStatusKey" />
							</form:select>
						</td>
						<td>
							<c:if test="${ticket.backlog.backlogKey eq 3}">
								<b>Sprint</b><br>	
								<c:choose>
									<c:when
										test="${!ticket.tarefa and !(ticket.sprint ne null and ticket.sprint.fechado)}">
										<form:select path="ticket.sprint.sprintKey">
											<form:options items="${sprints}" itemLabel="nome"
												itemValue="sprintKey" />
										</form:select>
									</c:when>
									<c:otherwise>
										<form:select path="ticket.sprint.sprintKey">
											<form:options items="${sprints}" itemLabel="nome"
												itemValue="sprintKey" />
										</form:select>
										<!--<form:hidden path="ticket.sprint.sprintKey" />
										<b>${ticket.sprint.nome}-->
									</c:otherwise>
								</c:choose>
							</c:if>
						</td>
						<td>
							<c:if test="${ticket.ticketKey gt 0}">
								<b>Data de Cria&ccedil;&atilde;o</b><br>
								<b><fmt:formatDate value="${ticket.dataDeCriacao}"type="both" /></b> <form:hidden path="ticket.dataDeCriacao"/> </b>
							</c:if>
						</td>
					</tr>
				</table>
				
				
				
				<div>
					<!-- REMOVI A IMAGEM GRAVATA, POIS ESSE ITEM AINDA NÃO ESTÄ DISPONÏNVEL NO CADASTRO DO MESMO. 
					img alt="Gravatar" align="bottom" title="Gravatar - Globally Recognized Avatars" src="http://www.gravatar.com/avatar/${ticket.reporter.emailMd5}?s=45" />
				    -->
					<form:hidden path="ticket.reporter.username"/><br/>
					<!-- <p>Reporter ${ticket.reporter.nome}</p> --> 
				</div>
				
				<!--
				<c:if test="${!ticket.tarefa}">
					<div>
						<c:choose>
							<c:when test="${usuarioLogado.productOwner}">
								<form:input path="ticket.valorDeNegocio" cssClass="required digits"/><br/>
							</c:when>
							<c:otherwise>
								<form:hidden path="ticket.valorDeNegocio"/>
								${ticket.valorDeNegocio gt 0 ? ticket.valorDeNegocio : "-"}<br/>
							</c:otherwise>
						</c:choose>
						<p>Valor de Neg&oacute;cio</p>
					</div>
				</c:if>
				-->
				<!--  
				<div>
					<c:choose>
						<c:when test="${usuarioLogado.equipe and empty ticket.filhos}">
							<form:input path="ticket.esforco" cssClass="required number" /><br/>
						</c:when>
						<c:otherwise>
							<form:hidden path="ticket.esforco"/>
							<b>${ticket.esforco gt 0 ? ticket.esforco : "-"}</b><br/>
						</c:otherwise>
					</c:choose>
					<p>Esfor&ccedil;o</p>
				</div>
				 -->				
				<c:if test="${ticket.tarefa or empty ticket.filhos}">
					<div>
						<p><b>Desenvolvedores</b>
						<pronto:icons name="editar.png" title="Alterar Desenvolvedores" onclick="alterarDesenvolvedores()"/></p>
						<c:forEach items="${desenvolvedores}" var="u" varStatus="s">
							<c:set var="checked" value="${false}"/>
							<c:forEach items="${ticket.desenvolvedores}" var="d">
								<c:if test="${d.username eq u.username}">
									<c:set var="checked" value="${true}"/>
								</c:if>
							</c:forEach>
							<div class="person desenvolvedor" style="display: ${checked ? 'inline' : 'none'}">
								<img alt="${u.username} - Clique para adicionar/remover" id="dev_img_${u.username}" class="${checked ? 'ativo' : 'inativo'}" align="bottom" title="${u.nome}" src="../commons/images/bb.gif" onclick="toogleDesenvolvedor('${u.username}')" style="cursor:pointer"/>
								<input id="dev_chk_${u.username}"  type="checkbox" name="desenvolvedor" value="${u.username}" ${checked ? 'checked="checked"' : ''} style="display: none;">
								<div class="person_name">${u.username}</div>
							</div>
						</c:forEach>
						<p></p>
					</div>
					<!--
					<div>
						<c:forEach items="${testadores}" var="u" varStatus="s">
							<c:set var="checked" value="${false}"/>
							<c:forEach items="${ticket.testadores}" var="d">
								<c:if test="${d.username eq u.username}">
									<c:set var="checked" value="${true}"/>
								</c:if>
							</c:forEach>
							<div class="person testador" style="display: ${checked ? 'inline' : 'none'}">
								<img alt="${u.username} - Clique para adicionar/remover" id="tes_img_${u.username}" class="${checked ? 'ativo' : 'inativo'}" align="bottom" title="${u.nome}" src="http://www.gravatar.com/avatar/${u.emailMd5}?s=45" onclick="toogleTestador('${u.username}')" style="cursor:pointer"/>
								<input id="tes_chk_${u.username}"  type="checkbox" name="testador" value="${u.username}" ${checked ? 'checked="checked"' : ''} style="display: none;">
								<div class="person_name">${u.username}</div>
							</div>
						</c:forEach>
						<p><b>Testadores</b><pronto:icons name="editar.png" title="Alterar Testadores" onclick="alterarTestadores()"/></p>
					</div>
					-->
				</c:if>
					
				
				<c:if test="${ticket.tarefa}">
					<form:hidden path="ticket.prioridade"/><br/>
				</c:if>
				
				<form:hidden path="ticket.prioridadeDoCliente"/><br/>
				<!--
				<c:if test="${empty ticket.filhos}">
				<div>
					<form:input path="ticket.branch"/><br/>
					<p>Branch</p>
				</div>
				</c:if>
				
				<div>
					<form:select path="ticket.par">
						<form:option value="true">Sim</form:option>
						<form:option value="false">N&atilde;o</form:option>
					</form:select>
					<br/>
					<p>Em Par?</p>
				</div>
				-->
				<h3>Descri&ccedil;&atilde;o</h3>
				
				<div>
					<form:textarea path="ticket.descricao" id="descricao"/>
				</div>
				<h3>Coment&aacute;rio</h3>
				<div>
					<textarea id="comentario" name="comentario"></textarea>
				</div>
			</div>
			<div align="center">
				<c:choose>
					<c:when test="${ticket.sprint ne null}">
						<button type="button" onclick="window.location.href='listarPorSprint.action?sprintKey=${ticket.sprint.sprintKey}'">Cancelar</button>
					</c:when>
					<c:otherwise>
						<button type="button" onclick="window.location.href='listarPorBacklog.action?backlogKey=${ticket.backlog.backlogKey}'">Cancelar</button>
					</c:otherwise>
				</c:choose>
				<button type="submit">Salvar</button>
			</div>
		</form>		
	
		<c:if test="${ticket.ticketKey gt 0}">
			<h2>Anexos</h2>
			<ul style="list-style-type: none;">
				<c:forEach items="${anexos}" var="anexo">
					<li>
						<c:choose>
							<c:when test="${anexo.imagem}">
								<pronto:icons name="imagem.gif" title="Imagem ${anexo.extensao}"/>
							</c:when>
							<c:when test="${anexo.planilha}">
								<pronto:icons name="excel.png" title="Plan&iacute;lha ${anexo.extensao}"/>
							</c:when>
							<c:when test="${anexo.extensao eq 'pdf'}">
								<pronto:icons name="pdf.png" title="Arquivo PDF"/>
							</c:when>
							<c:otherwise>
								<pronto:icons name="anexo.png" title="${anexo.extensao}"/>
							</c:otherwise>
						</c:choose>
						
						${anexo.nomeParaExibicao}
						<pronto:icons name="download.gif" title="Baixar Anexo" onclick="goTo('download.action?ticketKey=${ticket.ticketKey}&file=${anexo}')"/>
						<pronto:icons name="excluir.png" title="Excluir Anexo" onclick="excluirAnexo(${ticket.ticketKey},'${anexo}');"/>
					</li>
				</c:forEach>
			</ul>
			<h4>Incluir anexo</h4>						
			<form action="upload.action?ticketKey=${ticket.ticketKey}" method="post" enctype="multipart/form-data">
				<input type="file" name="arquivo">
				<button type="submit">Upload</button>
			</form>
		
			<h2>Log</h2>
			<ul>
				<c:set var="dataGrupo" value="${null}"/>
				<c:forEach items="${ticket.logs}" var="log">
					<fmt:formatDate value="${log.data}" pattern="dd/MM/yyyy" var="dataAtual"/>
					<c:if test="${dataGrupo eq null or dataGrupo ne dataAtual}">
						<h4><fmt:formatDate value="${log.data}" pattern="dd/MM/yyyy"/></h4>
						<fmt:formatDate value="${log.data}" pattern="dd/MM/yyyy" var="dataGrupo"/>
					</c:if>
					<c:choose>
						<c:when test="${log.campo eq 'descri&ccedil;&atilde;o'}">
							<li><fmt:formatDate value="${log.data}" pattern="HH:mm"/> - ${log.usuario} - Descri&ccedil;&atilde;o Alterada <a href="logDescricao.action?ticketHistoryKey=${log.ticketHistoryKey}">(ver)</a></li>
						</c:when>
						<c:otherwise>
							<li><fmt:formatDate value="${log.data}" pattern="HH:mm"/> - ${log.descricaoSemData}</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</c:if>
		
		<div title="Descri&ccedil;&atilde;o" id="dialog" style="display: none; width: 500px;">
			<div align="left" id="dialogDescricao">Aguarde...</div>
		</div>
	</body>
</html>