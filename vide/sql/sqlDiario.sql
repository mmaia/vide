CREATE TABLE diario
(
  id integer NOT NULL,
  username character varying(255),
  data timestamp without time zone,
  comentario text,
  titulo character(255),
  CONSTRAINT id PRIMARY KEY (id),
  CONSTRAINT usuario FOREIGN KEY (username)
      REFERENCES usuario (username) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (OIDS=FALSE);
ALTER TABLE diario OWNER TO pronto;



CREATE SEQUENCE seq_diario
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_diario OWNER TO pronto;
