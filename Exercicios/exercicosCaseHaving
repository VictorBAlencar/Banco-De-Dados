-- 1

SELECT p.nome, e.nome_evento, i.status_pagamento,
	CASE
		WHEN status_pagamento = 'pago' THEN 'Pago'
        WHEN status_pagamento = 'pendente' THEN 'Pendente'
        WHEN status_pagamento = 'cancelado' THEN 'Cancelado'
        ELSE 'Desconhecido'
	END AS status_descricao
FROM eventos AS e
	JOIN inscricoes AS i ON e.id = i.id_evento
	JOIN participantes AS p ON i.id_participante = p.id;

-- 2

SELECT nome_evento, data_inicio, data_fim, DATEDIFF(data_fim, data_inicio) AS 'Diferenca de Dias',
	CASE
		WHEN DATEDIFF(data_fim, data_inicio) = 0 THEN 'Evento de 1 dia'
        WHEN DATEDIFF(data_fim, data_inicio) <= 3 THEN  'Evento de Curta Duracao'
        ELSE 'Evento de Longa Duracao'
	END AS 'Classificao_Evento'
FROM eventos;

-- 3

SELECT nome, data_inscricao,
	CASE
		WHEN YEAR(data_inscricao) < 2024 THEN 'Veterano'
        ELSE 'Novo'
	END AS Tipo_participante
FROM participantes;

-- 4

SELECT nome, cargo, 
	CASE
		WHEN cargo = 'Diretor' THEN 'Gestor Principal'
        WHEN cargo = 'Coordenador' OR 'Supervisor' THEN 'Coordernacao'
        ELSE 'Apoio'
	END AS 'Funcao'
FROM organizadores;

-- 5     

SELECT nome, telefone, email,
	CASE
		WHEN telefone IS NOT NULL THEN 'Whatsapp'
        WHEN telefone IS NULL AND email IS NOT NULL THEN 'email'
        WHEN telefone IS NULL AND email IS NULL THEN 'Sem contato disponivel'
	END AS 'Prioridade Contato'
FROM participantes;

-- 6

SELECT nome_evento, tipo_evento,
	CASE
		WHEN tipo_evento = 'Campeonato' OR tipo_evento = 'Corrida' OR tipo_evento = 'Torneio' THEN 'Competicao'
        WHEN tipo_evento = 'Oficina' OR tipo_evento = 'Curso' OR tipo_evento = 'Palestra' THEN 'Formativo'
        ELSE 'Outro'
	END AS 'Classificao Tipo'
FROM eventos;

-- HAVING

-- 1

SELECT e.nome_evento, i.status_pagamento, count(i.status_pagamento) AS total
FROM eventos AS e
	JOIN inscricoes AS i ON e.id = i.id_evento
WHERE status_pagamento = 'pendente'
GROUP BY i.status_pagamento, e.nome_evento
HAVING total > 1;

-- 2

SELECT o.nome, COUNT(*) AS total_organizado 
FROM organizadores AS o
	JOIN eventos AS e ON o.id = e.organizador_id
GROUP BY o.nome
HAVING total_organizado > 1;

-- 3

SELECT p.nome, COUNT(i.id) AS total_inscritos FROM participantes AS p
	JOIN inscricoes AS i ON p.id = i.id_participante
GROUP BY p.nome
HAVING total_inscritos > 1;

-- 4

SELECT e.nome_evento, COUNT(i.status_pagamento) AS qtd_pendencias, COUNT(i.id) AS qtd_inscricoes 
FROM eventos AS e
	JOIN inscricoes AS i ON e.id = i.id_evento
WHERE status_pagamento = 'pendente'
GROUP BY e.nome_evento
HAVING qtd_pendencias > (qtd_inscricoes / 2);
