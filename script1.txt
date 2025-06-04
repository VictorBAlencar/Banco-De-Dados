DROP DATABASE gerenciamentoEventos;
CREATE DATABASE gerenciamentoEventos;
USE gerenciamentoEventos;

CREATE TABLE Organizadores
(
id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
nome_organizador VARCHAR(150) NOT NULL,
email_organizador VARCHAR(254) UNIQUE ,
telefone_organizador VARCHAR(15) UNIQUE NOT NULL,
cargo_organizador VARCHAR(100) NOT NULL
);

CREATE TABLE Eventos
(
id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
nome_evento VARCHAR(150) NOT NULL,
descricao TEXT,
data_inicio DATETIME NOT NULL,
data_fim DATETIME NOT NULL,
local_evento VARCHAR(250) NOT NULL,
id_organizador INT NOT NULL, -- evento tem que ter um organizador
tipo_evento VARCHAR(100) NOT NULL
);

CREATE TABLE Participantes
(
id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
nome_participante VARCHAR(150) NOT NULL,
email_participante VARCHAR(254) UNIQUE,
acompanhante BOOLEAN NOT NULL,
telefone_participante VARCHAR(15) UNIQUE
);

CREATE TABLE Inscricoes
(
id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
id_evento INT NOT NULL,
id_participante INT NOT NULL,
data_inscricao DATETIME NOT NULL,
forma_pagamento VARCHAR(50) NOT NULL,
status_pagamento VARCHAR(50) NOT NULL
);

ALTER TABLE Inscricoes
ADD CONSTRAINT fk_evento_inscricoes FOREIGN KEY (id_evento)
REFERENCES Eventos(id);

ALTER TABLE Inscricoes
ADD CONSTRAINT fk_participante_inscricoes FOREIGN KEY (id_participante)
REFERENCES Participantes(id);

ALTER TABLE Eventos
ADD CONSTRAINT fk_organizador_eventos FOREIGN KEY (id_organizador)
REFERENCES Organizadores(id);

INSERT INTO Organizadores (nome_organizador, email_organizador, telefone_organizador, cargo_organizador) VALUES
('Ana Souza', 'ana.souza@email.com', '(61) 99999-0001', 'Coordenadora de Eventos'),
('Carlos Silva', 'carlos.silva@email.com', '(61) 99999-0002', 'Gerente de Projetos'),
('Juliana Costa', 'juliana.costa@email.com', '(61) 99999-0003', 'Diretora de Marketing'),
('Roberta Lima', 'roberta.lima@email.com', '(61) 99999-0004', 'Analista de Eventos'),
('Felipe Oliveira', 'felipe.oliveira@email.com', '(61) 99999-0005', 'Coordenador de Logística'),
('Mariana Pereira', 'mariana.pereira@email.com', '(61) 99999-0006', 'Assistente de Eventos'),
('Paulo Santos', 'paulo.santos@email.com', '(61) 99999-0007', 'Supervisor de Produção'),
('Fernanda Alves', 'fernanda.alves@email.com', '(61) 99999-0008', 'Gerente de Comunicação'),
('Lucas Martins', 'lucas.martins@email.com', '(61) 99999-0009', 'Diretor de Operações'),
('Patrícia Rocha', 'patricia.rocha@email.com', '(61) 99999-0010', 'Analista de Marketing'),
('Ricardo Gomes', 'ricardo.gomes@email.com', '(61) 99999-0011', 'Coordenador de TI'),
('Aline Ferreira', 'aline.ferreira@email.com', '(61) 99999-0012', 'Assistente de Logística'),
('Eduardo Souza', 'eduardo.souza@email.com', '(61) 99999-0013', 'Gerente de Vendas'),
('Camila Costa', 'camila.costa@email.com', '(61) 99999-0014', 'Diretora de RH'),
('Gustavo Lima', 'gustavo.lima@email.com', '(61) 99999-0015', 'Analista de TI'),
('Tatiane Rocha', 'tatiane.rocha@email.com', '(61) 99999-0016', 'Coordenadora de Eventos'),
('Bruna Martins', 'bruna.martins@email.com', '(61) 99999-0017', 'Assistente de Comunicação'),
('Vinícius Silva', 'vinicius.silva@email.com', '(61) 99999-0018', 'Gerente de Produção'),
('Sofia Pereira', 'sofia.pereira@email.com', '(61) 99999-0019', 'Coordenadora de Marketing'),
('Daniela Costa', 'daniela.costa@email.com', '(61) 99999-0020', 'Analista de Logística'),
('Marcelo Gomes', 'marcelo.gomes@email.com', '(61) 99999-0021', 'Diretor de Eventos'),
('Isabela Rocha', 'isabela.rocha@email.com', '(61) 99999-0022', 'Assistente de TI'),
('André Oliveira', 'andre.oliveira@email.com', '(61) 99999-0023', 'Coordenador de RH'),
('Vanessa Lima', 'vanessa.lima@email.com', '(61) 99999-0024', 'Gerente de Comunicação'),
('Thiago Martins', 'thiago.martins@email.com', '(61) 99999-0025', 'Analista de Produção'),
('Juliana Rocha', 'juliana.rocha@email.com', '(61) 99999-0026', 'Coordenadora de Vendas'),
('Robson Costa', 'robson.costa@email.com', '(61) 99999-0027', 'Assistente de Eventos'),
('Larissa Pereira', 'larissa.pereira@email.com', '(61) 99999-0028', 'Gerente de TI'),
('Eduarda Lima', 'eduarda.lima@email.com', '(61) 99999-0029', 'Coordenadora de Comunicação'),
('Rafael Rocha', 'rafael.rocha@email.com', '(61) 99999-0030', 'Analista de RH'),
('Tatiane Martins', 'tatiane.martins@email.com', '(61) 99999-0031', 'Assistente de Produção'),
('Bruno Costa', 'bruno.costa@email.com', '(61) 99999-0032', 'Coordenador de Vendas'),
('Camila Pereira', 'camila.pereira@email.com', '(61) 99999-0033', 'Gerente de Eventos'),
('Felipe Rocha', 'felipe.rocha@email.com', '(61) 99999-0034', 'Analista de Comunicação'),
('Mariana Oliveira', 'mariana.oliveira@email.com', '(61) 99999-0035', 'Coordenadora de TI'),
('Paulo Lima', 'paulo.lima@email.com', '(61) 99999-0036', 'Assistente de Logística'),
('Roberta Pereira', 'roberta.pereira@email.com', '(61) 99999-0037', 'Gerente de RH'),
('Lucas Rocha', 'lucas.rocha@email.com', '(61) 99999-0038', 'Coordenador de Produção'),
('Patrícia Lima', 'patricia.lima@email.com', '(61) 99999-0039', 'Analista de Vendas'),
('Victor Borges de Alencar', 'victor.balencar@email.com','(61) 99999-8939', 'Gerenda de Vendas');


INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local_evento, id_organizador, tipo_evento) VALUES
('Festa Junina', 'Celebração típica com comidas e danças juninas', '2025-06-12 18:00:00', '2025-06-12 23:00:00', 'Praça Central', 1, 'Cultural'),
('Seminário de Tecnologia', 'Discussão sobre inovações tecnológicas', '2025-07-20 09:00:00', '2025-07-20 17:00:00', 'Centro de Convenções', 2, 'Acadêmico'),
('Feira de Empregos', 'Oportunidades de emprego e networking', '2025-08-15 10:00:00', '2025-08-15 16:00:00', 'Shopping Norte', 3, 'Profissional'),
('Exposição de Arte', 'Mostra de artistas locais', '2025-09-05 10:00:00', '2025-09-10 18:00:00', 'Galeria Municipal', 4, 'Cultural'),
('Congresso de Medicina', 'Encontro de profissionais da área da saúde', '2025-10-01 08:00:00', '2025-10-03 18:00:00', 'Hospital Universitário', 5, 'Acadêmico'),
('Festival de Música', 'Apresentações de bandas regionais', '2025-11-20 14:00:00', '2025-11-22 23:00:00', 'Parque da Cidade', 6, 'Cultural'),
('Hackathon Estudantil', 'Competição de programação', '2025-05-14 09:00:00', '2025-05-15 20:00:00', 'Universidade Federal', 7, 'Tecnologia'),
('Workshop de Fotografia', 'Técnicas de fotografia digital', '2025-06-01 13:00:00', '2025-06-01 18:00:00', 'Casa da Cultura', 8, 'Oficina'),
('Oficina de Escrita Criativa', 'Aprimoramento de escrita literária', '2025-07-08 09:00:00', '2025-07-08 12:00:00', 'Biblioteca Pública', 9, 'Oficina'),
('Encontro de Carros Antigos', 'Exposição de veículos clássicos', '2025-08-18 08:00:00', '2025-08-18 18:00:00', 'Estacionamento Central', 10, 'Exposição'),
('Feira de Ciências', 'Projetos científicos de estudantes', '2025-09-15 08:00:00', '2025-09-16 17:00:00', 'Ginásio Escolar', 11, 'Educacional'),
('Palestra sobre Sustentabilidade', 'Discussão sobre meio ambiente', '2025-06-10 10:00:00', '2025-06-10 12:00:00', 'Auditório Verde', 12, 'Ambiental'),
('Fórum de Negócios', 'Debates sobre empreendedorismo', '2025-07-22 08:00:00', '2025-07-22 17:00:00', 'Hotel Grand Business', 13, 'Empresarial'),
('Festival de Cinema', 'Exibição de curtas e longas metragens', '2025-08-10 18:00:00', '2025-08-14 23:00:00', 'CineCultura', 14, 'Cultural'),
('Encontro Literário', 'Roda de leitura e debate com autores', '2025-09-02 15:00:00', '2025-09-02 18:00:00', 'Livraria do Centro', 15, 'Educacional'),
('Semana do Meio Ambiente', 'Atividades educativas e ecológicas', '2025-06-03 09:00:00', '2025-06-07 17:00:00', 'Parque Ambiental', 16, 'Ambiental'),
('Conferência de Psicologia', 'Discussões científicas e práticas', '2025-10-12 09:00:00', '2025-10-14 18:00:00', 'Faculdade de Psicologia', 17, 'Acadêmico'),
('Maratona de Leitura', 'Leitura contínua de grandes obras', '2025-09-25 10:00:00', '2025-09-25 22:00:00', 'Biblioteca Central', 18, 'Cultural'),
('Festival de Cervejas Artesanais', 'Degustação e palestras sobre cerveja', '2025-07-30 17:00:00', '2025-08-01 23:00:00', 'Centro de Eventos', 19, 'Gastronômico'),
('Feira Gastronômica', 'Barracas com comidas típicas', '2025-11-10 11:00:00', '2025-11-12 22:00:00', 'Avenida Gourmet', 20, 'Gastronômico'),
('Simpósio de Direito', 'Discussões e atualizações jurídicas', '2025-10-20 08:00:00', '2025-10-21 17:00:00', 'Centro Jurídico', 21, 'Acadêmico'),
('Aulão de Zumba', 'Atividade física gratuita ao ar livre', '2025-05-18 09:00:00', '2025-05-18 11:00:00', 'Parque das Águas', 22, 'Esportivo'),
('Torneio de Xadrez', 'Competição entre jogadores amadores', '2025-06-28 14:00:00', '2025-06-28 18:00:00', 'Clube da Mente', 23, 'Competitivo'),
('Curso de Oratória', 'Melhoria da comunicação em público', '2025-07-15 18:00:00', '2025-07-17 21:00:00', 'Escola de Líderes', 24, 'Oficina'),
('Festival Vegano', 'Comidas, produtos e palestras', '2025-08-05 10:00:00', '2025-08-07 20:00:00', 'Centro Veg', 25, 'Gastronômico'),
('Feira do Livro', 'Venda e troca de livros usados e novos', '2025-09-10 10:00:00', '2025-09-13 19:00:00', 'Feira Popular', 26, 'Cultural'),
('Encontro de Startups', 'Networking e apresentações de pitch', '2025-10-08 09:00:00', '2025-10-08 17:00:00', 'Hub Inovação', 27, 'Empresarial'),
('Festa das Cores', 'Evento ao ar livre com pó colorido', '2025-11-01 15:00:00', '2025-11-01 21:00:00', 'Campo Aberto', 28, 'Recreativo'),
('Semana do Livro Infantil', 'Leitura e atividades para crianças', '2025-10-05 09:00:00', '2025-10-09 16:00:00', 'Biblioteca Infantil', 29, 'Educacional'),
('Festival do Japão', 'Cultura, comidas e danças japonesas', '2025-07-01 10:00:00', '2025-07-03 22:00:00', 'Pavilhão Cultural', 30, 'Cultural'),
('Corrida Solidária', 'Prova esportiva com arrecadação beneficente', '2025-06-22 07:00:00', '2025-06-22 10:00:00', 'Parque da Cidade', 31, 'Esportivo'),
('Amostra de Cinema LGBT', 'Filmes com temática LGBTQIA+', '2025-09-18 18:00:00', '2025-09-20 23:00:00', 'Cine Diversidade', 32, 'Cultural'),
('Festival de Dança Urbana', 'Apresentações e batalhas de dança', '2025-10-28 16:00:00', '2025-10-29 22:00:00', 'Quadra da Juventude', 33, 'Cultural'),
('Oficina de Robótica', 'Montagem e programação de robôs', '2025-08-20 09:00:00', '2025-08-21 16:00:00', 'Laboratório Maker', 34, 'Tecnologia'),
('Mostra de Cinema Nacional', 'Exibição de filmes brasileiros', '2025-09-01 19:00:00', '2025-09-04 22:00:00', 'Cine Brasil', 35, 'Cultural'),
('Fórum de Educação', 'Discussões sobre metodologias e políticas', '2025-06-15 08:00:00', '2025-06-16 17:00:00', 'Instituto Educacional', 36, 'Educacional'),
('Feira de Artesanato', 'Exposição e venda de artesanato local', '2025-08-12 10:00:00', '2025-08-14 20:00:00', 'Praça do Artesão', 37, 'Cultural'),
('Evento Geek', 'Quadrinhos, games, animes e cosplay', '2025-07-25 12:00:00', '2025-07-27 20:00:00', 'ExpoGeek Hall', 38, 'Entretenimento'),
('Oficina de Pintura', 'Técnicas de pintura acrílica para iniciantes', '2025-09-22 13:00:00', '2025-09-22 17:00:00', 'Ateliê Cultural', 39, 'Oficina'),
('Palestra Motivacional', 'Desenvolvimento pessoal e motivação', '2025-05-10 18:00:00', '2025-05-10 20:00:00', 'Teatro Municipal', 40, 'Educacional');


INSERT INTO Participantes (nome_participante, email_participante, acompanhante, telefone_participante) VALUES
('João Silva', 'joao.silva@email.com', true, '(61) 99999-0101'),
('Maria Oliveira', 'maria.oliveira@email.com', false, '(61) 99999-0102'),
('Carlos Souza', 'carlos.souza@email.com', true, '(61) 99999-0103'),
('Patrícia Costa', 'patricia.costa@email.com', false, '(61) 99999-0104'),
('Lucas Pereira', 'lucas.pereira@email.com', false, '(61) 99999-0105'),
('Aline Fernandes', 'aline.fernandes@email.com', true, '(61) 99999-0106'),
('Renato Santos', 'renato.santos@email.com', false, '(61) 99999-0107'),
('Juliana Rocha', 'juliana.rocha@email.com', true, '(61) 99999-0108'),
('Gabriel Lima', 'gabriel.lima@email.com', false, '(61) 99999-0109'),
('Tatiane Martins', 'tatiane.martins@email.com', true, '(61) 99999-0110'),
('Ana Costa', 'ana.costa@email.com', false, '(61) 99999-0111'),
('Felipe Silva', 'felipe.silva@email.com', false, '(61) 99999-0112'),
('Sofia Oliveira', 'sofia.oliveira@email.com', true, '(61) 99999-0113'),
('Marcos Souza', 'marcos.souza@email.com', false, '(61) 99999-0114'),
('Luana Pereira', 'luana.pereira@email.com', true, '(61) 99999-0115'),
('Eduardo Santos', 'eduardo.santos@email.com', false, '(61) 99999-0116'),
('Simone Rocha', 'simone.rocha@email.com', true, '(61) 99999-0117'),
('Vinícius Costa', 'vinicius.costa@email.com', false, '(61) 99999-0118'),
('Bruna Almeida', 'bruna.almeida@email.com', true, '(61) 99999-0119'),
('José Martins', 'jose.martins@email.com', false, '(61) 99999-0120'),
('Camila Lima', 'camila.lima@email.com', true, '(61) 99999-0121'),
('André Souza', 'andre.souza@email.com', false, '(61) 99999-0122'),
('Roberta Oliveira', 'roberta.oliveira@email.com', true, '(61) 99999-0123'),
('Carlos Silva', 'carlos.silva@email.com', false, '(61) 99999-0124'),
('Cláudia Costa', 'claudia.costa@email.com', true, '(61) 99999-0125'),
('Lucas Rocha', 'lucas.rocha@email.com', false, '(61) 99999-0126'),
('Maria Souza', 'maria.souza@email.com', false, '(61) 99999-0127'),
('Rafael Costa', 'rafael.costa@email.com', true, '(61) 99999-0128'),
('Kátia Martins', 'katia.martins@email.com', true, '(61) 99999-0129'),
('Tatiane Santos', 'tatiane.santos@email.com', false, '(61) 99999-0130'),
('Fábio Lima', 'fabio.lima@email.com', true, '(61) 99999-0131'),
('Daniela Pereira', 'daniela.pereira@email.com', true, '(61) 99999-0132'),
('Lucas Almeida', 'lucas.almeida@email.com', false, '(61) 99999-0133'),
('Paula Rocha', 'paula.rocha@email.com', false, '(61) 99999-0134'),
('Fernanda Silva', 'fernanda.silva@email.com', true, '(61) 99999-0135'),
('Bruno Costa', 'bruno.costa@email.com', false, '(61) 99999-0136'),
('Renata Lima', 'renata.lima@email.com', true, '(61) 99999-0137'),
('Aline Almeida', 'aline.almeida@email.com', true, '(61) 99999-0138'),
('Marcos Rocha', 'marcos.rocha@email.com', false, '(61) 99999-0139'),
('Mariana Santos', 'mariana.santos@email.com', false, '(61) 99999-0140');


INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, forma_pagamento, status_pagamento) VALUES
(1, 1, '2025-06-01 14:00:00', 'Cartão de Crédito', 'Pendente'),
(2, 2, '2025-07-10 11:30:00', 'Boleto Bancário', 'Pago'),
(3, 3, '2025-08-12 09:00:00', 'Cartão de Crédito', 'Pendente'),
(4, 4, '2025-09-01 17:00:00', 'Dinheiro', 'Pago'),
(5, 5, '2025-06-10 15:30:00', 'Cartão de Crédito', 'Pago'),
(6, 6, '2025-07-15 18:45:00', 'Boleto Bancário', 'Pendente'),
(7, 7, '2025-08-25 10:00:00', 'Pix', 'Pago'),
(8, 8, '2025-09-12 08:00:00', 'Boleto Bancário', 'Pendente'),
(9, 9, '2025-07-05 14:30:00', 'Cartão de Crédito', 'Pago'),
(10, 10, '2025-06-22 16:00:00', 'Dinheiro', 'Pendente'),
(11, 11, '2025-09-10 09:00:00', 'Pix', 'Pago'),
(12, 12, '2025-07-20 19:00:00', 'Cartão de Crédito', 'Pendente'),
(13, 13, '2025-06-03 13:00:00', 'Dinheiro', 'Pago'),
(14, 14, '2025-07-17 11:00:00', 'Boleto Bancário', 'Pago'),
(15, 15, '2025-08-06 10:30:00', 'Cartão de Crédito', 'Pendente'),
(16, 16, '2025-09-07 12:30:00', 'Pix', 'Pago'),
(17, 17, '2025-07-02 08:15:00', 'Dinheiro', 'Pendente'),
(18, 18, '2025-06-25 15:30:00', 'Boleto Bancário', 'Pago'),
(19, 19, '2025-08-19 13:00:00', 'Cartão de Crédito', 'Pendente'),
(20, 20, '2025-07-28 14:00:00', 'Pix', 'Pago'),
(21, 21, '2025-08-05 10:00:00', 'Dinheiro', 'Pendente'),
(22, 22, '2025-06-18 11:00:00', 'Cartão de Crédito', 'Pago'),
(23, 23, '2025-07-10 17:30:00', 'Boleto Bancário', 'Pendente'),
(24, 24, '2025-08-02 09:00:00', 'Pix', 'Pago'),
(25, 25, '2025-06-30 14:00:00', 'Dinheiro', 'Pendente'),
(26, 26, '2025-09-03 13:00:00', 'Cartão de Crédito', 'Pago'),
(27, 27, '2025-08-15 15:00:00', 'Boleto Bancário', 'Pendente'),
(28, 28, '2025-07-01 16:00:00', 'Pix', 'Pago'),
(29, 29, '2025-06-17 10:30:00', 'Cartão de Crédito', 'Pendente'),
(30, 30, '2025-08-10 11:00:00', 'Boleto Bancário', 'Pago'),
(31, 31, '2025-09-10 14:30:00', 'Dinheiro', 'Pendente'),
(32, 32, '2025-07-08 12:00:00', 'Pix', 'Pago'),
(33, 33, '2025-08-13 09:00:00', 'Cartão de Crédito', 'Pendente'),
(34, 34, '2025-09-05 13:30:00', 'Boleto Bancário', 'Pago'),
(35, 35, '2025-07-05 10:30:00', 'Dinheiro', 'Pendente'),
(36, 36, '2025-06-08 14:15:00', 'Pix', 'Pago'),
(37, 37, '2025-08-01 12:00:00', 'Cartão de Crédito', 'Pendente'),
(38, 38, '2025-07-19 15:00:00', 'Boleto Bancário', 'Pago'),
(39, 39, '2025-06-23 09:30:00', 'Dinheiro', 'Pendente'),
(40, 40, '2025-08-17 13:30:00', 'Pix', 'Pago');
