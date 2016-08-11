package br.com.bluesoft.pronto.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.bluesoft.pronto.dao.DiarioDao;
import br.com.bluesoft.pronto.dao.TicketDao;
import br.com.bluesoft.pronto.model.Diario;
import br.com.bluesoft.pronto.model.Usuario;

@Controller
public class DiarioController {
	private static final String VIEW_LISTAR = "/diario/diario.listar.jsp";
	private static final String VIEW_SALVAR = "/diario/diario.salvar.jsp";
	
	@Autowired
	private SessionFactory sessionFactory;

	@Autowired 
	private TicketDao ticketDao;
	@Autowired
	private DiarioDao diarioDao;

	private Logger log = Logger.getLogger(DiarioController.class.getName());

	@RequestMapping("/diario/listarDiario.action")
	public String listarPorDataComentario(final Model model, final String data,final HttpSession httpSession) {
		log.info("Entrou DiarioController.listarPorDataComentario");
		log.info("Dados do campo data ==>> " + data);
		Date aData = formataData(data);
		if (aData == null) {
			log.info("Data Pesquisa e null pesquisando hoje");
			aData = new Date();

		}
		model.addAttribute("ticketsComentario", ticketDao.listarPorDataComentario(aData));
		
		log.info("Executou DiarioController.listarPorDataComentario");
		
		final Usuario usuarioLogado = (Usuario) httpSession.getAttribute("usuarioLogado");
		model.addAttribute("diarios", diarioDao.listar(usuarioLogado,true));
		log.info("Executou diarioDao.Listar");
		
		return VIEW_LISTAR;
	}

	/**
	 * Salvar o Diário
	 */
	@RequestMapping("/diario/salvarDiario.action")
	public String salvarDiario(final Model model, final Diario diario, final HttpSession httpSession) throws Exception {
		log.info("Entrou DiarioController.SalvarDiario ==> " + diario.getComentario());
	
		final Usuario usuarioLogado = (Usuario) httpSession.getAttribute("usuarioLogado");
		diario.setUsername(usuarioLogado);
		
		if (diario.getComentario() != null & diario.getTitulo() != null){
			if( !(diario.getComentario().equals("") & diario.getTitulo().equals("") )) {
				Date data = new Date();
				diario.setData(data);
				log.info("Data do comentario ===>" + data);
				// Pegar o usuário logado no sistema
				diario.setUsername(usuarioLogado);
				log.info("Usuario logado ==>" + usuarioLogado.getNome());
				log.info("iniciando transacao hibernate para salvar diario");
				final Transaction tx = sessionFactory.getCurrentSession().beginTransaction();
				sessionFactory.getCurrentSession().saveOrUpdate(diario);
				sessionFactory.getCurrentSession().flush();
				tx.commit();
				log.info("Salvou DiarioController.SalvarDiario");
			}	
		}
		return "redirect:listarDiarioScrum.action";
	}

	@RequestMapping("/diario/listarDiarioScrum.action")
	public String listarDiarioScrum(final Model model, final Diario diario,
			final HttpSession httpSession) {
		log.info("Entrou DiarioController.listarDiarioScrum");
		final Usuario usuarioLogado = (Usuario) httpSession.getAttribute("usuarioLogado");
		log.info("Testar se é ScrumMaster");
		if(usuarioLogado.isScrumMaster()){
			log.info("E ScrumMaster ==> " + usuarioLogado.isScrumMaster() );
			model.addAttribute("diarios", diarioDao.listar(usuarioLogado,true));
		}else{
			log.info("Nao e ScrumMaster ==> "+ usuarioLogado.isScrumMaster() );	
			model.addAttribute("diarios", diarioDao.listar(usuarioLogado,false));
		}
		log.info("Sair DiarioController.listarDiarioScrum");
		
		return VIEW_SALVAR;
	}	
		
	
	/**
	 * retorna a data formatada ou null se não for possível transformar o dado
	 * em uma data válida
	 * 
	 * @param data
	 *            no formato dd/MM/yyyy
	 * @return um objeto Date representando a data passada.
	 */
	private Date formataData(String data) {
		try {
			Calendar cal = new GregorianCalendar();
			String dia = data.substring(0, 2);
			String mes = data.substring(3, 5);
			String ano = data.substring(6);

			cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dia));
			cal.set(Calendar.MONTH, Integer.parseInt(mes) - 1);
			cal.set(Calendar.YEAR, Integer.parseInt(ano));
			return cal.getTime();
		} catch (Exception e) {
			return null;
		}
	}



}
