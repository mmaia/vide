--atributos da base
SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET search_path = public, pg_catalog;

--Tabela de backlog
INSERT INTO backlog (backlog_key, descricao) VALUES (1, 'Ideias');
INSERT INTO backlog (backlog_key, descricao) VALUES (5, 'Impedimentos');
INSERT INTO backlog (backlog_key, descricao) VALUES (4, 'Lixeira');
INSERT INTO backlog (backlog_key, descricao) VALUES (2, 'Product Backlog');
INSERT INTO backlog (backlog_key, descricao) VALUES (3, 'Sprint Backlog');

--Tabela de cliente
INSERT INTO cliente (cliente_key, nome) VALUES (1, 'Cliente');


--Tabela de usuários
INSERT INTO usuario (username, password, nome, email, email_md5, cliente_key) VALUES ('herivelto', '1jA/DaVCUJIgqsLHU9vR7Q==', 'Herivelto Gabriel', 'heriveltogabriel@gmail.com', 'a34bdb04675cadd589b53cdeb9e233d9', NULL);
INSERT INTO usuario (username, password, nome, email, email_md5, cliente_key) VALUES ('mmaia', 'EvswQhHw1lSvwK+6xJB4Iw==', 'Marcos Maia', 'maia.marcos@gmail.com', '4028cc213dce8b7e00e7d1f30245af70', NULL);
INSERT INTO usuario (username, password, nome, email, email_md5, cliente_key) VALUES ('admin', 'YpRgIcC0HjdDVhHk9JHenQ==', 'Administrador do Pronto', 'adm@adm.com.br', NULL, NULL);



--Lista de Status do Kanban
INSERT INTO kanban_status (kanban_status_key, descricao) VALUES (1, 'To Do');
INSERT INTO kanban_status (kanban_status_key, descricao) VALUES (2, 'Doing');
INSERT INTO kanban_status (kanban_status_key, descricao) VALUES (4, 'Done');
INSERT INTO kanban_status (kanban_status_key, descricao) VALUES (3, 'Interveniência');



--Lista de papéis
INSERT INTO papel (papel_key, descricao) VALUES (1, 'Product Owner');
INSERT INTO papel (papel_key, descricao) VALUES (2, 'Scrum Master');
INSERT INTO papel (papel_key, descricao) VALUES (6, 'Administrador');
INSERT INTO papel (papel_key, descricao) VALUES (7, 'Cliente');
INSERT INTO papel (papel_key, descricao) VALUES (9, 'Equipe');

--Lista de tipos de tickets
INSERT INTO tipo_de_ticket (tipo_de_ticket_key, descricao) VALUES (1, 'Ideia');
INSERT INTO tipo_de_ticket (tipo_de_ticket_key, descricao) VALUES (3, 'Defeito');
INSERT INTO tipo_de_ticket (tipo_de_ticket_key, descricao) VALUES (5, 'Impedimento');
INSERT INTO tipo_de_ticket (tipo_de_ticket_key, descricao) VALUES (6, 'Tarefa');
INSERT INTO tipo_de_ticket (tipo_de_ticket_key, descricao) VALUES (2, 'Projeto');

--Lista de tipos de retrospectiva.
INSERT INTO tipo_retrospectiva_item (tipo_retrospectiva_item_key, descricao) VALUES (1, 'O que foi bem');
INSERT INTO tipo_retrospectiva_item (tipo_retrospectiva_item_key, descricao) VALUES (2, 'O que pode ser melhorado');

--Lista de papeis de usuário.
INSERT INTO usuario_papel (usuario_key, papel_key) VALUES ('admin', 1);
INSERT INTO usuario_papel (usuario_key, papel_key) VALUES ('admin', 2);
INSERT INTO usuario_papel (usuario_key, papel_key) VALUES ('admin', 6);
INSERT INTO usuario_papel (usuario_key, papel_key) VALUES ('admin', 9);
INSERT INTO usuario_papel (usuario_key, papel_key) VALUES ('mmaia', 1);
INSERT INTO usuario_papel (usuario_key, papel_key) VALUES ('mmaia', 9);
INSERT INTO usuario_papel (usuario_key, papel_key) VALUES ('herivelto', 1);
INSERT INTO usuario_papel (usuario_key, papel_key) VALUES ('herivelto', 9);

