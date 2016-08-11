package br.com.bluesoft.pronto.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import br.com.bluesoft.pronto.annotations.Label;


@Entity
@SequenceGenerator(name = "SEQ_DIARIO", sequenceName = "SEQ_DIARIO")
public class Diario {

	@Id
	@GeneratedValue(generator = "SEQ_DIARIO")
	private int id;
	
	@Label("data")
	private Date data;
	
	@Label("t&iacute;tulo")
	private String titulo;
	
	@Label("coment&aacute;rio")
	private String comentario;
	
	@ManyToOne
	@JoinColumn(name = "USERNAME")
	private Usuario username;

	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	
	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}
	

	public void setUsername(Usuario usuario) {
		this.username = usuario;
	}
	public Usuario getUsername() {
		return username;
	}
	

}
