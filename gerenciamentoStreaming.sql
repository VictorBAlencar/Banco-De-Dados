DROP DATABASE gerenciamentoStreaming;
CREATE DATABASE gerenciamentoStreaming;
USE gerenciamentoStreaming;

CREATE TABLE Conteudos
(
id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
titulo VARCHAR(100) NOT NULL,
tipo VARCHAR(50) NOT NULL,
genero VARCHAR(100) NOT NULL,
ano_lancamento YEAR NOT NULL,
duracao_minutos SMALLINT NOT NULL,
classificacao_etaria VARCHAR(10) NOT NULL,
status_disponibilidade BOOLEAN NOT NULL,
idioma VARCHAR(100) NOT NULL
);

CREATE TABLE Planos
(
id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
nome_plano VARCHAR(50) NOT NULL,
preco_mensal DECIMAL(5,2) NOT NULL,
resolucao_maxima VARCHAR(10) NOT NULL,
numero_telas TINYINT,
preco_anual DECIMAL(6,2)
);

CREATE TABLE Usuarios
(
id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
email VARCHAR(254) NOT NULL UNIQUE,
telefone VARCHAR(15) UNIQUE,
data_cadastro DATE NOT NULL,
plano_id INT NOT NULL,
sexo VARCHAR(50)
);


CREATE TABLE Historico
(
id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
usuario_id INT NOT NULL,
conteudo_id INT,
data_visualizacao DATETIME,
progresso_percentual TINYINT CHECK(progresso_percentual BETWEEN 0 AND 100),
favorito VARCHAR(100)
);

CREATE TABLE Avaliacoes
(
id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
usuario_id INT NOT NULL,
conteudo_id INT NOT NULL,
nota TINYINT NOT NULL CHECK(nota BETWEEN 0 AND 5),
comentario TEXT,
data_avaliacao DATETIME NOT NULL,
premios VARCHAR(150)
);

ALTER TABLE Usuarios
ADD CONSTRAINT fk_usuarios_plano FOREIGN KEY (plano_id)
REFERENCES Planos(id);

ALTER TABLE Historico
ADD CONSTRAINT fk_historico_usuario FOREIGN KEY (usuario_id)
REFERENCES Usuarios(id);

ALTER TABLE Historico
ADD CONSTRAINT fk_historico_conteudo FOREIGN KEY (conteudo_id)
REFERENCES Conteudos(id);

ALTER TABLE Avaliacoes
ADD CONSTRAINT fk_avaliacoes_usuario FOREIGN KEY (usuario_id)
REFERENCES Usuarios(id);

ALTER TABLE Avaliacoes
ADD CONSTRAINT fk_avaliacoes_conteudo FOREIGN KEY (conteudo_id)
REFERENCES Conteudos(id);

INSERT INTO Conteudos (titulo, tipo, genero, ano_lancamento, duracao_minutos, classificacao_etaria, status_disponibilidade, idioma) VALUES
('Vingadores: Ultimato', 'Filme', 'Ação, Aventura, Ficção Científica', 2019, 181, '12', true, 'Inglês'),
('Breaking Bad', 'Série', 'Crime, Drama, Thriller', 2008, 60, '18', true, 'Inglês'),
('Coringa', 'Filme', 'Drama, Crime, Thriller', 2019, 122, '16', true, 'Inglês'),
('Game of Thrones', 'Série', 'Aventura, Drama, Fantasia', 2011, 60, '18', true, 'Inglês'),
('O Rei Leão', 'Filme', 'Animação, Aventura, Drama', 1994, 88, 'Livre', true, 'Inglês'),
('Stranger Things', 'Série', 'Drama, Fantasia, Mistério', 2016, 50, '14', true, 'Inglês'),
('O Poderoso Chefão', 'Filme', 'Crime, Drama', 1972, 175, '18', true, 'Inglês'),
('The Witcher', 'Série', 'Aventura, Drama, Fantasia', 2019, 60, '16', true, 'Inglês'),
('Parasita', 'Filme', 'Comédia, Drama, Thriller', 2019, 132, '16', true, 'Coreano'),
('O Senhor dos Anéis: A Sociedade do Anel', 'Filme', 'Aventura, Drama, Fantasia', 2001, 178, '12', true, 'Inglês'),
('La Casa de Papel', 'Série', 'Ação, Crime, Drama', 2017, 50, '16', true, 'Espanhol'),
('Matrix', 'Filme', 'Ação, Ficção Científica', 1999, 136, '12', true, 'Inglês'),
('The Mandalorian', 'Série', 'Ação, Aventura, Fantasia', 2019, 40, '10', true, 'Inglês'),
('Os Incríveis', 'Filme', 'Animação, Aventura, Família', 2004, 115, 'Livre', true, 'Inglês'),
('O Lobo de Wall Street', 'Filme', 'Comédia, Drama', 2013, 180, '18', true, 'Inglês'),
('Dark', 'Série', 'Drama, Mistério, Ficção Científica', 2017, 60, '16', true, 'Alemão'),
('O Exorcista', 'Filme', 'Terror', 1973, 122, '16', true, 'Inglês'),
('Rick and Morty', 'Série', 'Animação, Aventura, Comédia', 2013, 22, '16', true, 'Inglês'),
('A Forma da Água', 'Filme', 'Aventura, Drama, Fantasia', 2017, 123, '16', true, 'Inglês'),
('Avengers: Age of Ultron', 'Filme', 'Ação, Aventura, Ficção Científica', 2015, 141, '12', true, 'Inglês'),
('The Crown', 'Série', 'Biografia, Drama, História', 2016, 60, '14', true, 'Inglês'),
('The Office', 'Série', 'Comédia', 2005, 22, '12', true, 'Inglês'),
('Mad Men', 'Série', 'Drama', 2007, 50, '16', true, 'Inglês'),
('Pulp Fiction', 'Filme', 'Crime, Drama', 1994, 154, '18', true, 'Inglês'),
('Narcos', 'Série', 'Crime, Drama', 2015, 50, '16', true, 'Espanhol'),
('Interstellar', 'Filme', 'Aventura, Drama, Ficção Científica', 2014, 169, '12', true, 'Inglês'),
('Friends', 'Série', 'Comédia, Romance', 1994, 22, '12', true, 'Inglês'),
('Blade Runner 2049', 'Filme', 'Drama, Ficção Científica', 2017, 164, '14', true, 'Inglês'),
('O Grande Lebowski', 'Filme', 'Comédia, Crime', 1998, 117, '18', true, 'Inglês'),
('Sherlock', 'Série', 'Crime, Drama, Mistério', 2010, 60, '14', true, 'Inglês'),
('Avatar', 'Filme', 'Ação, Aventura, Fantasia', 2009, 162, '12', true, 'Inglês'),
('Seinfeld', 'Série', 'Comédia', 1989, 22, '12', true, 'Inglês'),
('The Boys', 'Série', 'Ação, Crime, Drama', 2019, 60, '16', true, 'Inglês'),
('Se7en', 'Filme', 'Crime, Drama, Mistério', 1995, 127, '18', true, 'Inglês'),
('Black Mirror', 'Série', 'Drama, Ficção Científica, Thriller', 2011, 60, '16', true, 'Inglês'),
('Jurassic Park', 'Filme', 'Aventura, Ficção Científica', 1993, 127, '10', true, 'Inglês'),
('O Silêncio dos Inocentes', 'Filme', 'Crime, Drama, Mistério', 1991, 118, '16', true, 'Inglês'),
('A Jornada do Herói', 'Filme', 'Aventura', 2024, 120, '12', TRUE, 'Português'),
('O Mistério da Cidade Perdida', 'Filme', 'Mistério', 2023, 140, '14', TRUE, 'Inglês'),
('Conexões Perigosas', 'Série', 'Suspense', 2024, 45, '16', TRUE, 'Espanhol');

INSERT INTO Planos (nome_plano, preco_mensal, resolucao_maxima, numero_telas, preco_anual) VALUES
('Plano Básico 1', 19.99, '720p', 1, 199.99),
('Plano Básico 2', 21.99, '720p', 1, 219.99),
('Plano Padrão 1', 29.99, '1080p', 2, 299.99),
('Plano Padrão 2', 32.99, '1080p', 2, 329.99),
('Plano Premium 1', 49.99, '4K', 4, 499.99),
('Plano Premium 2', 52.99, '4K', 4, 529.99),
('Plano Ultra 1', 69.99, '8K', 6, 699.99),
('Plano Ultra 2', 75.99, '8K', 6, 759.99),
('Plano Starter 1', 14.99, '480p', 1, 149.99),
('Plano Starter 2', 16.99, '480p', 1, 169.99),
('Plano Família 1', 39.99, '1080p', 4, 399.99),
('Plano Família 2', 42.99, '1080p', 4, 429.99),
('Plano Plus 1', 24.99, '720p', 2, 249.99),
('Plano Plus 2', 27.99, '720p', 2, 279.99),
('Plano Top 1', 59.99, '4K', 5, 599.99),
('Plano Top 2', 62.99, '4K', 5, 629.99),
('Plano Premium Plus 1', 89.99, '4K HDR', 6, 899.99),
('Plano Premium Plus 2', 92.99, '4K HDR', 6, 929.99),
('Plano Master 1', 99.99, '8K', 7, 999.99),
('Plano Master 2', 104.99, '8K', 7, 1049.99),
('Plano Executivo 1', 79.99, '4K', 3, 799.99),
('Plano Executivo 2', 82.99, '4K', 3, 829.99),
('Plano Mega 1', 89.99, '8K', 5, 899.99),
('Plano Mega 2', 95.99, '8K', 5, 959.99),
('Plano Student 1', 9.99, '480p', 1, 99.99),
('Plano Student 2', 11.99, '480p', 1, 119.99),
('Plano Light 1', 17.99, '720p', 1, 179.99),
('Plano Light 2', 20.99, '720p', 1, 209.99),
('Plano Advanced 1', 39.99, '1080p', 3, 399.99),
('Plano Advanced 2', 42.99, '1080p', 3, 429.99),
('Plano Superior 1', 69.99, '4K', 5, 699.99),
('Plano Superior 2', 72.99, '4K', 5, 729.99),
('Plano Gold 1', 99.99, '8K', 6, 999.99),
('Plano Gold 2', 104.99, '8K', 6, 1049.99),
('Plano Prime 1', 89.99, '4K HDR', 4, 899.99),
('Plano Prime 2', 94.99, '4K HDR', 4, 949.99),
('Plano Pro 1', 109.99, '8K', 6, 1099.99),
('Plano Pro 2', 114.99, '8K', 6, 1149.99),
('Plano Star', 359.99, '16K', 8, 1845.99),
('Plano Star 2', 459.99, '32K', 16, 2199.99);

INSERT INTO Usuarios (nome, email, telefone, data_cadastro, plano_id, sexo) VALUES
('João Silva', 'joao.silva@email.com', '(61) 99999-0101', '2025-03-01', 1, 'Masculino'),
('Maria Oliveira', 'maria.oliveira@email.com', '(61) 99999-0102', '2025-02-15', 2, 'Feminino'),
('Carlos Souza', 'carlos.souza@email.com', '(61) 99999-0103', '2025-01-10', 3, 'Masculino'),
('Patrícia Costa', 'patricia.costa@email.com', '(61) 99999-0104', '2025-03-05', 4, 'Feminino'),
('Lucas Pereira', 'lucas.pereira@email.com', '(61) 99999-0105', '2025-02-20', 5, 'Masculino'),
('Aline Fernandes', 'aline.fernandes@email.com', '(61) 99999-0106', '2025-01-25', 6, 'Feminino'),
('Renato Santos', 'renato.santos@email.com', '(61) 99999-0107', '2025-03-10', 7, 'Masculino'),
('Juliana Rocha', 'juliana.rocha@email.com', '(61) 99999-0108', '2025-02-05', 8, 'Feminino'),
('Gabriel Lima', 'gabriel.lima@email.com', '(61) 99999-0109', '2025-01-15', 9, 'Masculino'),
('Tatiane Martins', 'tatiane.martins@email.com', '(61) 99999-0110', '2025-03-20', 10, 'Feminino'),
('Ana Costa', 'ana.costa@email.com', '(61) 99999-0111', '2025-02-10', 11, 'Feminino'),
('Felipe Silva', 'felipe.silva@email.com', '(61) 99999-0112', '2025-01-05', 12, 'Masculino'),
('Sofia Oliveira', 'sofia.oliveira@email.com', '(61) 99999-0113', '2025-02-25', 13, 'Feminino'),
('Marcos Souza', 'marcos.souza@email.com', '(61) 99999-0114', '2025-03-15', 14, 'Masculino'),
('Luana Pereira', 'luana.pereira@email.com', '(61) 99999-0115', '2025-01-30', 15, 'Feminino'),
('Eduardo Santos', 'eduardo.santos@email.com', '(61) 99999-0116', '2025-02-18', 16, 'Masculino'),
('Simone Rocha', 'simone.rocha@email.com', '(61) 99999-0117', '2025-03-30', 17, 'Feminino'),
('Vinícius Costa', 'vinicius.costa@email.com', '(61) 99999-0118', '2025-01-22', 18, 'Masculino'),
('Bruna Almeida', 'bruna.almeida@email.com', '(61) 99999-0119', '2025-02-02', 19, 'Feminino'),
('José Martins', 'jose.martins@email.com', '(61) 99999-0120', '2025-03-12', 20, 'Masculino'),
('Camila Lima', 'camila.lima@email.com', '(61) 99999-0121', '2025-01-18', 21, 'Feminino'),
('André Souza', 'andre.souza@email.com', '(61) 99999-0122', '2025-03-02', 22, 'Masculino'),
('Roberta Oliveira', 'roberta.oliveira@email.com', '(61) 99999-0123', '2025-02-08', 23, 'Feminino'),
('Carlos Silva', 'carlos.silva@email.com', '(61) 99999-0124', '2025-01-12', 24, 'Masculino'),
('Cláudia Costa', 'claudia.costa@email.com', '(61) 99999-0125', '2025-03-18', 25, 'Feminino'),
('Lucas Rocha', 'lucas.rocha@email.com', '(61) 99999-0126', '2025-02-12', 26, 'Masculino'),
('Maria Souza', 'maria.souza@email.com', '(61) 99999-0127', '2025-03-08', 27, 'Feminino'),
('Rafael Costa', 'rafael.costa@email.com', '(61) 99999-0128', '2025-01-28', 28, 'Masculino'),
('Kátia Martins', 'katia.martins@email.com', '(61) 99999-0129', '2025-02-28', 29, 'Feminino'),
('Tatiane Santos', 'tatiane.santos@email.com', '(61) 99999-0130', '2025-03-22', 30, 'Feminino'),
('Fábio Lima', 'fabio.lima@email.com', '(61) 99999-0131', '2025-01-07', 31, 'Masculino'),
('Daniela Pereira', 'daniela.pereira@email.com', '(61) 99999-0132', '2025-03-25', 32, 'Feminino'),
('Lucas Almeida', 'lucas.almeida@email.com', '(61) 99999-0133', '2025-01-02', 33, 'Masculino'),
('Carlos Almeida', 'carlos.almeida@email.com', '5511987654321', '2025-04-01', 34, 'Masculino'),
('Fernanda Souza', 'fernanda.souza@email.com', '5511987654322', '2025-04-02', 35, 'Feminino'),
('Juliana Costa', 'juliana.costa@email.com', '5511987654323', '2025-04-03', 36, 'Feminino'),
('Rafael Pereira', 'rafael.pereira@email.com', '5511987654324', '2025-04-04', 37, 'Masculino'),
('Lucas Martins', 'lucas.martins@email.com', '5511987654325', '2025-04-05', 38, 'Masculino'),
('Paula Oliveira', 'paula.oliveira@email.com', '5511987654326', '2025-04-06', 39, 'Feminino'),
('Gustavo Lima', 'gustavo.lima@email.com', '5511987654327', '2025-04-07', 40, 'Masculino');


INSERT INTO Historico (usuario_id, conteudo_id, data_visualizacao, progresso_percentual, favorito) VALUES
(1, 1, '2025-03-01 20:00:00', 50, 'Sim'),
(2, 2, '2025-03-05 21:30:00', 100, 'Não'),
(3, 3, '2025-02-20 18:45:00', 25, 'Sim'),
(4, 4, '2025-03-10 16:00:00', 80, 'Sim'),
(5, 5, '2025-02-15 19:00:00', 100, 'Sim'),
(6, 6, '2025-03-15 22:00:00', 60, 'Não'),
(7, 7, '2025-01-20 14:30:00', 90, 'Sim'),
(8, 8, '2025-02-25 20:00:00', 100, 'Sim'),
(9, 9, '2025-03-05 18:30:00', 40, 'Não'),
(10, 10, '2025-03-10 16:30:00', 50, 'Sim'),
(11, 11, '2025-03-25 19:00:00', 100, 'Não'),
(12, 12, '2025-01-30 17:00:00', 80, 'Sim'),
(13, 13, '2025-02-28 22:00:00', 25, 'Sim'),
(14, 14, '2025-03-12 20:00:00', 60, 'Sim'),
(15, 15, '2025-01-10 21:30:00', 70, 'Não'),
(16, 16, '2025-03-01 18:00:00', 100, 'Sim'),
(17, 17, '2025-03-05 15:00:00', 50, 'Não'),
(18, 18, '2025-01-25 19:30:00', 90, 'Sim'),
(19, 19, '2025-03-20 20:15:00', 25, 'Não'),
(20, 20, '2025-02-15 18:30:00', 100, 'Sim'),
(21, 21, '2025-01-05 20:00:00', 50, 'Sim'),
(22, 22, '2025-02-10 21:45:00', 60, 'Não'),
(23, 23, '2025-03-22 18:15:00', 80, 'Sim'),
(24, 24, '2025-01-28 19:30:00', 100, 'Não'),
(25, 25, '2025-02-05 16:00:00', 90, 'Sim'),
(26, 26, '2025-03-15 14:30:00', 40, 'Não'),
(27, 27, '2025-02-28 22:30:00', 50, 'Sim'),
(28, 28, '2025-03-10 18:45:00', 60, 'Não'),
(29, 29, '2025-03-08 17:15:00', 100, 'Sim'),
(30, 30, '2025-02-20 14:30:00', 80, 'Sim'),
(31, 31, '2025-03-01 15:00:00', 25, 'Não'),
(32, 32, '2025-03-05 22:00:00', 50, 'Sim'),
(33, 33, '2025-02-25 18:30:00', 100, 'Não'),
(34, 34, '2025-03-18 16:45:00', 90, 'Sim'),
(35, 35, '2025-03-10 19:00:00', 100, 'Sim'),
(36, 36, '2025-01-18 17:30:00', 40, 'Não'),
(37, 37, '2025-02-05 22:15:00', 50, 'Sim'),
(38, 38, '2025-03-25 18:30:00', 100, 'Não'),
(39, 39, '2025-03-20 19:15:00', 80, 'Sim'),
(40, 40, '2025-02-10 20:30:00', 25, 'Sim');


INSERT INTO Avaliacoes (usuario_id, conteudo_id, nota, comentario, data_avaliacao, premios) VALUES
(1, 1, 5, 'Excelente filme, gostei muito da trama!', '2025-03-02 18:00:00', 'Oscar de Melhor Filme'),
(2, 2, 4, 'Série incrível, mas o final poderia ser melhor.', '2025-03-05 20:00:00', 'Globo de Ouro'),
(3, 3, 3, 'Filme bom, mas o ritmo é um pouco lento em algumas partes.', '2025-02-20 19:00:00', 'Nenhum prêmio'),
(4, 4, 5, 'Uma das melhores séries que já assisti, história envolvente.', '2025-03-12 22:00:00', 'Emmy'),
(5, 5, 5, 'Adorei a animação e a música, muito nostálgico!', '2025-02-16 21:00:00', 'Oscar de Melhor Animação'),
(6, 6, 4, 'Ótima série, mas os episódios poderiam ser mais curtos.', '2025-03-16 20:00:00', 'Emmy'),
(7, 7, 5, 'Um filme espetacular, ótima atuação de todos os envolvidos!', '2025-01-25 15:00:00', 'Oscar de Melhor Ator'),
(8, 8, 4, 'Filme muito bom, porém a trama poderia ser mais profunda.', '2025-02-28 20:30:00', 'Golden Globe'),
(9, 9, 3, 'Achei o filme um pouco cansativo, mas com boas cenas.', '2025-03-05 19:00:00', 'Nenhum prêmio'),
(10, 10, 5, 'Um dos melhores filmes que já vi, muito bem dirigido!', '2025-03-10 20:00:00', 'Oscar de Melhor Diretor'),
(11, 11, 2, 'Achei o filme fraco, não gostei do enredo.', '2025-03-26 19:30:00', 'Nenhum prêmio'),
(12, 12, 4, 'Série boa, mas achei que alguns personagens não foram bem explorados.', '2025-02-25 17:00:00', 'Golden Globe'),
(13, 13, 3, 'O filme é bom, mas tem partes muito previsíveis.', '2025-02-28 20:00:00', 'Nenhum prêmio'),
(14, 14, 4, 'Gostei bastante, mas achei o final um pouco fraco.', '2025-03-15 19:00:00', 'Emmy'),
(15, 15, 5, 'Excelente filme, não tenho o que reclamar, perfeito!', '2025-01-10 21:30:00', 'Oscar de Melhor Filme'),
(16, 16, 4, 'Uma boa série, com bons episódios e personagens.', '2025-03-02 17:45:00', 'Golden Globe'),
(17, 17, 3, 'Filme bom, mas nada surpreendente.', '2025-03-06 19:30:00', 'Nenhum prêmio'),
(18, 18, 5, 'Perfeito! Fiquei encantado com a produção do filme.', '2025-01-20 18:00:00', 'Oscar de Melhor Roteiro'),
(19, 19, 2, 'Achei o filme um pouco sem sentido, não me prendeu.', '2025-03-19 20:30:00', 'Nenhum prêmio'),
(20, 20, 4, 'Muito bom, mas alguns personagens poderiam ser mais desenvolvidos.', '2025-03-21 22:00:00', 'Golden Globe'),
(21, 21, 5, 'Filme excelente, muito bem feito, adorei!', '2025-01-05 20:30:00', 'Oscar de Melhor Filme'),
(22, 22, 4, 'Boa série, mas algumas partes são bem previsíveis.', '2025-02-14 21:00:00', 'Golden Globe'),
(23, 23, 3, 'Achei o filme mediano, com bons momentos, mas com falhas.', '2025-03-23 18:15:00', 'Nenhum prêmio'),
(24, 24, 5, 'Adorei o filme, é um dos meus favoritos agora.', '2025-01-28 20:30:00', 'Oscar de Melhor Diretor'),
(25, 25, 4, 'Boa animação, mas a história poderia ser mais emocionante.', '2025-02-06 19:00:00', 'Oscar de Melhor Animação'),
(26, 26, 3, 'Achei o filme divertido, mas nada excepcional.', '2025-03-15 21:30:00', 'Nenhum prêmio'),
(27, 27, 4, 'Gostei da série, mas o final me deixou com muitas dúvidas.', '2025-02-05 20:30:00', 'Emmy'),
(28, 28, 5, 'Filme incrível, muito bem feito, me emocionou do começo ao fim.', '2025-03-10 17:00:00', 'Oscar de Melhor Filme'),
(29, 29, 2, 'Não gostei muito do filme, achei a trama previsível e sem graça.', '2025-03-08 22:30:00', 'Nenhum prêmio'),
(30, 30, 4, 'Boa série, mas achei que alguns episódios arrastaram demais.', '2025-02-25 20:00:00', 'Golden Globe'),
(31, 31, 5, 'Amei o filme! Tudo foi muito bem feito, excelente atuação!', '2025-03-01 18:15:00', 'Oscar de Melhor Roteiro'),
(32, 32, 4, 'Série boa, mas com alguns altos e baixos. No geral, gostei.', '2025-03-02 19:30:00', 'Golden Globe'),
(33, 33, 3, 'Filme bom, mas achei que os personagens poderiam ser mais desenvolvidos.', '2025-02-20 17:00:00', 'Nenhum prêmio'),
(34, 34, 5, 'Maravilhoso! Uma das melhores experiências que tive assistindo a um filme.', '2025-03-18 20:45:00', 'Oscar de Melhor Filme'),
(35, 35, 5, 'Ótimo filme, atuação sensacional, recomendo muito!', '2025-03-12 22:15:00', 'Oscar de Melhor Ator'),
(36, 36, 4, 'Filme bom, mas a narrativa ficou um pouco arrastada em alguns momentos.', '2025-03-08 16:00:00', 'Golden Globe'),
(37, 37, 3, 'Filme mediano, com alguns momentos interessantes, mas com muito espaço para melhorar.', '2025-01-15 18:30:00', 'Nenhum prêmio'),
(38, 38, 5, 'Excelente! Super recomendo, trama envolvente e atuações maravilhosas.', '2025-02-15 17:30:00', 'Oscar de Melhor Filme'),
(39, 39, 4, 'Série boa, mas o ritmo é muito lento às vezes. Gostei no geral.', '2025-03-19 22:00:00', 'Emmy'),
(40, 40, 5, 'Filme incrível, adorei cada detalhe, atuação perfeita.', '2025-03-22 21:30:00', 'Oscar de Melhor Diretor');
