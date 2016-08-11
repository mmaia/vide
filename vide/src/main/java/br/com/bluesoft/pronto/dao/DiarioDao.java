package br.com.bluesoft.pronto.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import br.com.bluesoft.pronto.model.Diario;
import br.com.bluesoft.pronto.model.TicketComentario;
import br.com.bluesoft.pronto.model.Usuario;

@Repository 
public class DiarioDao extends DaoHibernate<Diario, Integer> {

	private Logger log = Logger.getLogger(DiarioDao.class.getName());

	public DiarioDao() {
		super(Diario.class);
	}

	/**
	 * Listar Diário
	 * 
	 */

	@SuppressWarnings("unchecked")
	public List<Diario> listar(Usuario usuario,boolean scrumMaster) {
		log.info("Entrou DiarioDao.listar");
		final Calendar cal = new GregorianCalendar();
		final long data =  new Date().getTime();
		cal.setTimeInMillis(data);

		final StringBuilder builder = new StringBuilder();
		builder.append(" select distinct diario from Diario diario");
	
		//colocar hora, min, seg e milis com valor 0 para início do dia.
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 1);
		cal.set(Calendar.MILLISECOND, 0);
		Date dataInicial = cal.getTime();
		log.info("Data inicial ==>> " + dataInicial);
		
		//coloca hora, min, seg e milis para fim do dia.
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		cal.set(Calendar.MILLISECOND, 999);
		Date dataFinal = cal.getTime();
		log.info("Data final ==>> " + dataFinal);
		
		builder.append(" where diario.data between :dataInicial and :dataFinal");
	
		if (!scrumMaster) {
			builder.append(" and diario.username = :user ");
		}	
		
		builder.append(" order by diario.data desc");
		
		final Query query = getSession().createQuery(builder.toString());
		
		query.setParameter("dataInicial", dataInicial);
		query.setParameter("dataFinal", dataFinal);
		if (!scrumMaster) {
			query.setParameter("user", usuario);
		}
		List result = query.list();
	return result;
	}
	
	@SuppressWarnings("unchecked")
	
	
	public List<TicketComentario> listarDiarioPorData(Date dataDiario)
	{
		final long data = dataDiario.getTime();
		final Calendar cal = new GregorianCalendar();
		cal.setTimeInMillis(data);
		log.info("Data pesquisada ==>> " + cal.toString());
		final StringBuilder builder = new StringBuilder();
		builder.append(" select distinct diario from Diario diario");
		
		//colocar hora, min, seg e milis com valor 0 para início do dia.
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 1);
		cal.set(Calendar.MILLISECOND, 0);
		Date dataInicial = cal.getTime();
		log.info("Data inicial ==>> " + dataInicial);
		
		//coloca hora, min, seg e milis para fim do dia.
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		cal.set(Calendar.MILLISECOND, 999);
		Date dataFinal = cal.getTime();
		log.info("Data final ==>> " + dataFinal);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		
		builder.append(" where diario.data between :dataInicial and :dataFinal order by d.data desc");
		
//		builder.append(" where tc.data between " + sdf.format(dataInicial) + " and " + sdf.format(dataFinal));
		final Query query = getSession().createQuery(builder.toString());
		query.setParameter("dataInicial", dataInicial);
		query.setParameter("dataFinal", dataFinal);
		List result = query.list();
		log.info("Executou TicketDao.listarPorDataComentario qtde comentario do dia ==>> " + result.size());
		return result;
	}
	


}
