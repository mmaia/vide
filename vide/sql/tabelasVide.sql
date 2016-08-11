--
-- PostgreSQL database dump
--

-- Started on 2010-02-24 14:49:42 BRT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1525 (class 1259 OID 16563)
-- Dependencies: 6
-- Name: backlog; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE backlog (
    backlog_key integer NOT NULL,
    descricao character varying(255)
);


ALTER TABLE public.backlog OWNER TO pronto;

--
-- TOC entry 1537 (class 1259 OID 16612)
-- Dependencies: 6
-- Name: banco_de_dados; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE banco_de_dados (
    banco_de_dados_key integer NOT NULL,
    nome character varying(120)
);


ALTER TABLE public.banco_de_dados OWNER TO pronto;

--
-- TOC entry 1543 (class 1259 OID 16633)
-- Dependencies: 6
-- Name: cliente; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE cliente (
    cliente_key integer NOT NULL,
    nome character varying(120)
);


ALTER TABLE public.cliente OWNER TO pronto;

--
-- TOC entry 1539 (class 1259 OID 16621)
-- Dependencies: 6
-- Name: execucao; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE execucao (
    execucao_key integer NOT NULL,
    script_key integer NOT NULL,
    banco_de_dados_key integer NOT NULL,
    username character varying(255),
    data timestamp without time zone
);


ALTER TABLE public.execucao OWNER TO pronto;

--
-- TOC entry 1514 (class 1259 OID 16541)
-- Dependencies: 6
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: pronto
--

CREATE SEQUENCE hibernate_sequence
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO pronto;

--
-- TOC entry 1526 (class 1259 OID 16566)
-- Dependencies: 6
-- Name: kanban_status; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE kanban_status (
    kanban_status_key integer NOT NULL,
    descricao character varying(255)
);


ALTER TABLE public.kanban_status OWNER TO pronto;

--
-- TOC entry 1527 (class 1259 OID 16569)
-- Dependencies: 6
-- Name: papel; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE papel (
    papel_key integer NOT NULL,
    descricao character varying(255)
);


ALTER TABLE public.papel OWNER TO pronto;

--
-- TOC entry 1541 (class 1259 OID 16627)
-- Dependencies: 6
-- Name: retrospectiva; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE retrospectiva (
    retrospectiva_key integer NOT NULL,
    sprint_key integer NOT NULL
);


ALTER TABLE public.retrospectiva OWNER TO pronto;

--
-- TOC entry 1542 (class 1259 OID 16630)
-- Dependencies: 6
-- Name: retrospectiva_item; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE retrospectiva_item (
    retrospectiva_item_key integer NOT NULL,
    retrospectiva_key integer NOT NULL,
    tipo_retrospectiva_item_key integer NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.retrospectiva_item OWNER TO pronto;

--
-- TOC entry 1538 (class 1259 OID 16615)
-- Dependencies: 6
-- Name: script; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE script (
    script_key integer NOT NULL,
    descricao character varying(120) NOT NULL,
    script text
);


ALTER TABLE public.script OWNER TO pronto;

--
-- TOC entry 1520 (class 1259 OID 16553)
-- Dependencies: 6
-- Name: seq_banco_de_dados; Type: SEQUENCE; Schema: public; Owner: pronto
--

CREATE SEQUENCE seq_banco_de_dados
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_banco_de_dados OWNER TO pronto;

--
-- TOC entry 1524 (class 1259 OID 16561)
-- Dependencies: 6
-- Name: seq_cliente; Type: SEQUENCE; Schema: public; Owner: pronto
--

CREATE SEQUENCE seq_cliente
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_cliente OWNER TO pronto;

--
-- TOC entry 1521 (class 1259 OID 16555)
-- Dependencies: 6
-- Name: seq_execucao; Type: SEQUENCE; Schema: public; Owner: pronto
--

CREATE SEQUENCE seq_execucao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_execucao OWNER TO pronto;

--
-- TOC entry 1522 (class 1259 OID 16557)
-- Dependencies: 6
-- Name: seq_retrospectiva; Type: SEQUENCE; Schema: public; Owner: pronto
--

CREATE SEQUENCE seq_retrospectiva
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_retrospectiva OWNER TO pronto;

--
-- TOC entry 1523 (class 1259 OID 16559)
-- Dependencies: 6
-- Name: seq_retrospectiva_item; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_retrospectiva_item
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_retrospectiva_item OWNER TO postgres;

--
-- TOC entry 1519 (class 1259 OID 16551)
-- Dependencies: 6
-- Name: seq_script; Type: SEQUENCE; Schema: public; Owner: pronto
--

CREATE SEQUENCE seq_script
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_script OWNER TO pronto;

--
-- TOC entry 1516 (class 1259 OID 16545)
-- Dependencies: 6
-- Name: seq_sprint; Type: SEQUENCE; Schema: public; Owner: pronto
--

CREATE SEQUENCE seq_sprint
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_sprint OWNER TO pronto;

--
-- TOC entry 1515 (class 1259 OID 16543)
-- Dependencies: 6
-- Name: seq_ticket; Type: SEQUENCE; Schema: public; Owner: pronto
--

CREATE SEQUENCE seq_ticket
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_ticket OWNER TO pronto;

--
-- TOC entry 1517 (class 1259 OID 16547)
-- Dependencies: 6
-- Name: seq_ticket_comentario; Type: SEQUENCE; Schema: public; Owner: pronto
--

CREATE SEQUENCE seq_ticket_comentario
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_ticket_comentario OWNER TO pronto;

--
-- TOC entry 1518 (class 1259 OID 16549)
-- Dependencies: 6
-- Name: seq_ticket_log; Type: SEQUENCE; Schema: public; Owner: pronto
--

CREATE SEQUENCE seq_ticket_log
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_ticket_log OWNER TO pronto;

--
-- TOC entry 1528 (class 1259 OID 16572)
-- Dependencies: 6
-- Name: sprint; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE sprint (
    sprint_key integer NOT NULL,
    nome character varying(255),
    data_inicial timestamp without time zone,
    data_final timestamp without time zone,
    fechado boolean NOT NULL,
    atual boolean NOT NULL
);


ALTER TABLE public.sprint OWNER TO pronto;

--
-- TOC entry 1529 (class 1259 OID 16575)
-- Dependencies: 1810 6
-- Name: ticket; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE ticket (
    ticket_key integer NOT NULL,
    titulo character varying(255),
    descricao text,
    cliente character varying(255),
    solicitador character varying(255),
    branch character varying(255),
    valor_de_negocio integer NOT NULL,
    esforco double precision NOT NULL,
    par boolean NOT NULL,
    planejado boolean NOT NULL,
    data_de_criacao timestamp without time zone DEFAULT now(),
    data_de_pronto timestamp without time zone,
    reporter_key character varying(255),
    pai integer,
    kanban_status_key integer,
    sprint integer,
    tipo_de_ticket_key integer,
    backlog_key integer,
    prioridade integer,
    cliente_key integer,
    prioridade_do_cliente integer
);


ALTER TABLE public.ticket OWNER TO pronto;

--
-- TOC entry 1530 (class 1259 OID 16582)
-- Dependencies: 6
-- Name: ticket_comentario; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE ticket_comentario (
    ticket_comentario_key integer NOT NULL,
    usuario_key character varying(255),
    data timestamp without time zone,
    texto text,
    ticket_key integer
);


ALTER TABLE public.ticket_comentario OWNER TO pronto;

--
-- TOC entry 1531 (class 1259 OID 16588)
-- Dependencies: 6
-- Name: ticket_desenvolvedor; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE ticket_desenvolvedor (
    ticket_key integer NOT NULL,
    usuario_key character varying(255) NOT NULL
);


ALTER TABLE public.ticket_desenvolvedor OWNER TO pronto;

--
-- TOC entry 1533 (class 1259 OID 16594)
-- Dependencies: 6
-- Name: ticket_log; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE ticket_log (
    ticket_history_key integer NOT NULL,
    campo character varying(255),
    operacao integer NOT NULL,
    valor_antigo text,
    valor_novo text,
    data timestamp without time zone,
    usuario character varying(255),
    ticket_key integer
);


ALTER TABLE public.ticket_log OWNER TO pronto;

--
-- TOC entry 1532 (class 1259 OID 16591)
-- Dependencies: 6
-- Name: ticket_testador; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE ticket_testador (
    ticket_key integer NOT NULL,
    usuario_key character varying(255) NOT NULL
);


ALTER TABLE public.ticket_testador OWNER TO pronto;

--
-- TOC entry 1534 (class 1259 OID 16600)
-- Dependencies: 6
-- Name: tipo_de_ticket; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE tipo_de_ticket (
    tipo_de_ticket_key integer NOT NULL,
    descricao character varying(255)
);


ALTER TABLE public.tipo_de_ticket OWNER TO pronto;

--
-- TOC entry 1540 (class 1259 OID 16624)
-- Dependencies: 6
-- Name: tipo_retrospectiva_item; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE tipo_retrospectiva_item (
    tipo_retrospectiva_item_key integer NOT NULL,
    descricao character varying(120)
);


ALTER TABLE public.tipo_retrospectiva_item OWNER TO pronto;

--
-- TOC entry 1535 (class 1259 OID 16603)
-- Dependencies: 6
-- Name: usuario; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE usuario (
    username character varying(100) NOT NULL,
    password character varying(30),
    nome character varying(150),
    email character varying(170),
    email_md5 character varying(170),
    cliente_key integer
);


ALTER TABLE public.usuario OWNER TO pronto;

--
-- TOC entry 1536 (class 1259 OID 16609)
-- Dependencies: 6
-- Name: usuario_papel; Type: TABLE; Schema: public; Owner: pronto; Tablespace: 
--

CREATE TABLE usuario_papel (
    usuario_key character varying(255) NOT NULL,
    papel_key integer NOT NULL
);


ALTER TABLE public.usuario_papel OWNER TO pronto;

--
-- TOC entry 1812 (class 2606 OID 16637)
-- Dependencies: 1525 1525
-- Name: backlog_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY backlog
    ADD CONSTRAINT backlog_pkey PRIMARY KEY (backlog_key);


--
-- TOC entry 1843 (class 2606 OID 16661)
-- Dependencies: 1537 1537
-- Name: banco_de_dados_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY banco_de_dados
    ADD CONSTRAINT banco_de_dados_pkey PRIMARY KEY (banco_de_dados_key);


--
-- TOC entry 1857 (class 2606 OID 16673)
-- Dependencies: 1543 1543
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cliente_key);


--
-- TOC entry 1847 (class 2606 OID 16665)
-- Dependencies: 1539 1539
-- Name: execucao_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY execucao
    ADD CONSTRAINT execucao_pkey PRIMARY KEY (execucao_key);


--
-- TOC entry 1814 (class 2606 OID 16639)
-- Dependencies: 1526 1526
-- Name: kanban_status_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY kanban_status
    ADD CONSTRAINT kanban_status_pkey PRIMARY KEY (kanban_status_key);


--
-- TOC entry 1816 (class 2606 OID 16641)
-- Dependencies: 1527 1527
-- Name: papel_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY papel
    ADD CONSTRAINT papel_pkey PRIMARY KEY (papel_key);


--
-- TOC entry 1855 (class 2606 OID 16671)
-- Dependencies: 1542 1542
-- Name: retrospectiva_item_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY retrospectiva_item
    ADD CONSTRAINT retrospectiva_item_pkey PRIMARY KEY (retrospectiva_item_key);


--
-- TOC entry 1853 (class 2606 OID 16669)
-- Dependencies: 1541 1541
-- Name: retrospectiva_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY retrospectiva
    ADD CONSTRAINT retrospectiva_pkey PRIMARY KEY (retrospectiva_key);


--
-- TOC entry 1845 (class 2606 OID 16663)
-- Dependencies: 1538 1538
-- Name: script_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY script
    ADD CONSTRAINT script_pkey PRIMARY KEY (script_key);


--
-- TOC entry 1818 (class 2606 OID 16643)
-- Dependencies: 1528 1528
-- Name: sprint_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY sprint
    ADD CONSTRAINT sprint_pkey PRIMARY KEY (sprint_key);


--
-- TOC entry 1829 (class 2606 OID 16645)
-- Dependencies: 1530 1530
-- Name: ticket_comentario_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY ticket_comentario
    ADD CONSTRAINT ticket_comentario_pkey PRIMARY KEY (ticket_comentario_key);


--
-- TOC entry 1831 (class 2606 OID 16647)
-- Dependencies: 1531 1531 1531
-- Name: ticket_desenvolvedor_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY ticket_desenvolvedor
    ADD CONSTRAINT ticket_desenvolvedor_pkey PRIMARY KEY (ticket_key, usuario_key);


--
-- TOC entry 1835 (class 2606 OID 16651)
-- Dependencies: 1533 1533
-- Name: ticket_log_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY ticket_log
    ADD CONSTRAINT ticket_log_pkey PRIMARY KEY (ticket_history_key);


--
-- TOC entry 1827 (class 2606 OID 16653)
-- Dependencies: 1529 1529
-- Name: ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (ticket_key);


--
-- TOC entry 1833 (class 2606 OID 16649)
-- Dependencies: 1532 1532 1532
-- Name: ticket_testador_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY ticket_testador
    ADD CONSTRAINT ticket_testador_pkey PRIMARY KEY (ticket_key, usuario_key);


--
-- TOC entry 1837 (class 2606 OID 16655)
-- Dependencies: 1534 1534
-- Name: tipo_de_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY tipo_de_ticket
    ADD CONSTRAINT tipo_de_ticket_pkey PRIMARY KEY (tipo_de_ticket_key);


--
-- TOC entry 1851 (class 2606 OID 16667)
-- Dependencies: 1540 1540
-- Name: tipo_retrospectiva_item_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY tipo_retrospectiva_item
    ADD CONSTRAINT tipo_retrospectiva_item_pkey PRIMARY KEY (tipo_retrospectiva_item_key);


--
-- TOC entry 1841 (class 2606 OID 16657)
-- Dependencies: 1536 1536 1536
-- Name: usuario_papel_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY usuario_papel
    ADD CONSTRAINT usuario_papel_pkey PRIMARY KEY (usuario_key, papel_key);


--
-- TOC entry 1839 (class 2606 OID 16659)
-- Dependencies: 1535 1535
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (username);


--
-- TOC entry 1848 (class 1259 OID 16797)
-- Dependencies: 1539
-- Name: idx_execucao_banco_de_dados; Type: INDEX; Schema: public; Owner: pronto; Tablespace: 
--

CREATE INDEX idx_execucao_banco_de_dados ON execucao USING btree (banco_de_dados_key);


--
-- TOC entry 1849 (class 1259 OID 16796)
-- Dependencies: 1539
-- Name: idx_execucao_script; Type: INDEX; Schema: public; Owner: pronto; Tablespace: 
--

CREATE INDEX idx_execucao_script ON execucao USING btree (script_key);


--
-- TOC entry 1819 (class 1259 OID 16792)
-- Dependencies: 1529
-- Name: idx_ticket_backlog; Type: INDEX; Schema: public; Owner: pronto; Tablespace: 
--

CREATE INDEX idx_ticket_backlog ON ticket USING btree (backlog_key);


--
-- TOC entry 1820 (class 1259 OID 16795)
-- Dependencies: 1529
-- Name: idx_ticket_branch; Type: INDEX; Schema: public; Owner: pronto; Tablespace: 
--

CREATE INDEX idx_ticket_branch ON ticket USING btree (branch);


--
-- TOC entry 1821 (class 1259 OID 16794)
-- Dependencies: 1529
-- Name: idx_ticket_cliente; Type: INDEX; Schema: public; Owner: pronto; Tablespace: 
--

CREATE INDEX idx_ticket_cliente ON ticket USING btree (cliente_key);


--
-- TOC entry 1822 (class 1259 OID 16791)
-- Dependencies: 1529
-- Name: idx_ticket_kaban_status; Type: INDEX; Schema: public; Owner: pronto; Tablespace: 
--

CREATE INDEX idx_ticket_kaban_status ON ticket USING btree (kanban_status_key);


--
-- TOC entry 1823 (class 1259 OID 16789)
-- Dependencies: 1529
-- Name: idx_ticket_sprint; Type: INDEX; Schema: public; Owner: pronto; Tablespace: 
--

CREATE INDEX idx_ticket_sprint ON ticket USING btree (sprint);


--
-- TOC entry 1824 (class 1259 OID 16790)
-- Dependencies: 1529
-- Name: idx_ticket_tipo_de_ticket; Type: INDEX; Schema: public; Owner: pronto; Tablespace: 
--

CREATE INDEX idx_ticket_tipo_de_ticket ON ticket USING btree (tipo_de_ticket_key);


--
-- TOC entry 1825 (class 1259 OID 16793)
-- Dependencies: 1529
-- Name: idx_ticket_titulo; Type: INDEX; Schema: public; Owner: pronto; Tablespace: 
--

CREATE INDEX idx_ticket_titulo ON ticket USING btree (titulo);


--
-- TOC entry 1873 (class 2606 OID 16674)
-- Dependencies: 1536 1527 1815
-- Name: fk4d25cd3566f20c10; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY usuario_papel
    ADD CONSTRAINT fk4d25cd3566f20c10 FOREIGN KEY (papel_key) REFERENCES papel(papel_key);


--
-- TOC entry 1874 (class 2606 OID 16679)
-- Dependencies: 1838 1535 1536
-- Name: fk4d25cd358e8e74a4; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY usuario_papel
    ADD CONSTRAINT fk4d25cd358e8e74a4 FOREIGN KEY (usuario_key) REFERENCES usuario(username);


--
-- TOC entry 1867 (class 2606 OID 16684)
-- Dependencies: 1531 1529 1826
-- Name: fk50e2688d6484a110; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY ticket_desenvolvedor
    ADD CONSTRAINT fk50e2688d6484a110 FOREIGN KEY (ticket_key) REFERENCES ticket(ticket_key);


--
-- TOC entry 1869 (class 2606 OID 16694)
-- Dependencies: 1532 1529 1826
-- Name: fk50e2688d6484a110; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY ticket_testador
    ADD CONSTRAINT fk50e2688d6484a110 FOREIGN KEY (ticket_key) REFERENCES ticket(ticket_key);


--
-- TOC entry 1868 (class 2606 OID 16689)
-- Dependencies: 1531 1535 1838
-- Name: fk50e2688d8e8e74a4; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY ticket_desenvolvedor
    ADD CONSTRAINT fk50e2688d8e8e74a4 FOREIGN KEY (usuario_key) REFERENCES usuario(username);


--
-- TOC entry 1870 (class 2606 OID 16699)
-- Dependencies: 1838 1535 1532
-- Name: fk50e2688d8e8e74a4; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY ticket_testador
    ADD CONSTRAINT fk50e2688d8e8e74a4 FOREIGN KEY (usuario_key) REFERENCES usuario(username);


--
-- TOC entry 1871 (class 2606 OID 16704)
-- Dependencies: 1826 1529 1533
-- Name: fk7c90d7916484a110; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY ticket_log
    ADD CONSTRAINT fk7c90d7916484a110 FOREIGN KEY (ticket_key) REFERENCES ticket(ticket_key);


--
-- TOC entry 1875 (class 2606 OID 16749)
-- Dependencies: 1539 1538 1844
-- Name: fk_execucao_script; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY execucao
    ADD CONSTRAINT fk_execucao_script FOREIGN KEY (script_key) REFERENCES script(script_key);


--
-- TOC entry 1877 (class 2606 OID 16759)
-- Dependencies: 1539 1838 1535
-- Name: fk_execucao_usuario; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY execucao
    ADD CONSTRAINT fk_execucao_usuario FOREIGN KEY (username) REFERENCES usuario(username);


--
-- TOC entry 1876 (class 2606 OID 16754)
-- Dependencies: 1539 1537 1842
-- Name: fk_exeucao_banco_de_dados; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY execucao
    ADD CONSTRAINT fk_exeucao_banco_de_dados FOREIGN KEY (banco_de_dados_key) REFERENCES banco_de_dados(banco_de_dados_key);


--
-- TOC entry 1880 (class 2606 OID 16769)
-- Dependencies: 1541 1542 1852
-- Name: fk_retrospectiva_item_retrospectiva; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY retrospectiva_item
    ADD CONSTRAINT fk_retrospectiva_item_retrospectiva FOREIGN KEY (retrospectiva_key) REFERENCES retrospectiva(retrospectiva_key);


--
-- TOC entry 1878 (class 2606 OID 16774)
-- Dependencies: 1850 1540 1540
-- Name: fk_retrospectiva_item_tipo_retrospectiva_item; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY tipo_retrospectiva_item
    ADD CONSTRAINT fk_retrospectiva_item_tipo_retrospectiva_item FOREIGN KEY (tipo_retrospectiva_item_key) REFERENCES tipo_retrospectiva_item(tipo_retrospectiva_item_key);


--
-- TOC entry 1879 (class 2606 OID 16764)
-- Dependencies: 1541 1817 1528
-- Name: fk_retrospectiva_sprint; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY retrospectiva
    ADD CONSTRAINT fk_retrospectiva_sprint FOREIGN KEY (sprint_key) REFERENCES sprint(sprint_key);


--
-- TOC entry 1864 (class 2606 OID 16784)
-- Dependencies: 1856 1529 1543
-- Name: fk_ticket_cliente; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fk_ticket_cliente FOREIGN KEY (cliente_key) REFERENCES cliente(cliente_key);


--
-- TOC entry 1866 (class 2606 OID 16714)
-- Dependencies: 1530 1535 1838
-- Name: fk_ticket_comentario_usuario; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY ticket_comentario
    ADD CONSTRAINT fk_ticket_comentario_usuario FOREIGN KEY (usuario_key) REFERENCES usuario(username);


--
-- TOC entry 1872 (class 2606 OID 16779)
-- Dependencies: 1856 1543 1535
-- Name: fk_usuario_cliente; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_usuario_cliente FOREIGN KEY (cliente_key) REFERENCES cliente(cliente_key);


--
-- TOC entry 1865 (class 2606 OID 16709)
-- Dependencies: 1530 1529 1826
-- Name: fkae76b2f46484a110; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY ticket_comentario
    ADD CONSTRAINT fkae76b2f46484a110 FOREIGN KEY (ticket_key) REFERENCES ticket(ticket_key);


--
-- TOC entry 1858 (class 2606 OID 16719)
-- Dependencies: 1525 1811 1529
-- Name: fkcbe86b0c6bb18e7e; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fkcbe86b0c6bb18e7e FOREIGN KEY (backlog_key) REFERENCES backlog(backlog_key);


--
-- TOC entry 1859 (class 2606 OID 16724)
-- Dependencies: 1529 1535 1838
-- Name: fkcbe86b0c9fff54d7; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fkcbe86b0c9fff54d7 FOREIGN KEY (reporter_key) REFERENCES usuario(username);


--
-- TOC entry 1860 (class 2606 OID 16729)
-- Dependencies: 1817 1529 1528
-- Name: fkcbe86b0cb145678c; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fkcbe86b0cb145678c FOREIGN KEY (sprint) REFERENCES sprint(sprint_key);


--
-- TOC entry 1861 (class 2606 OID 16734)
-- Dependencies: 1529 1526 1813
-- Name: fkcbe86b0cc41181bf; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fkcbe86b0cc41181bf FOREIGN KEY (kanban_status_key) REFERENCES kanban_status(kanban_status_key);


--
-- TOC entry 1862 (class 2606 OID 16739)
-- Dependencies: 1836 1534 1529
-- Name: fkcbe86b0cd1a566bc; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fkcbe86b0cd1a566bc FOREIGN KEY (tipo_de_ticket_key) REFERENCES tipo_de_ticket(tipo_de_ticket_key);


--
-- TOC entry 1863 (class 2606 OID 16744)
-- Dependencies: 1826 1529 1529
-- Name: fkcbe86b0ce7f57efc; Type: FK CONSTRAINT; Schema: public; Owner: pronto
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fkcbe86b0ce7f57efc FOREIGN KEY (pai) REFERENCES ticket(ticket_key);


--
-- TOC entry 1885 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2010-02-24 14:49:42 BRT

--
-- PostgreSQL database dump complete
--

