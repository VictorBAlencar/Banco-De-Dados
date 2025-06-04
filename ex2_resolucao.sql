USE ex2;

-- 1

SELECT p.nome,
SUM(CASE
		WHEN t.prioridade = 'Baixa' THEN 1
        ELSE 0
	END) AS 'Prioridade Baixa',
SUM(CASE
		WHEN t.prioridade = 'Média' THEN 1
        ELSE 0
	END) AS 'Prioridade Normal',
SUM(CASE
		WHEN t.prioridade = 'Alta' THEN 1
        ELSE 0
	END) AS 'Prioridade Alta',
SUM(CASE
		WHEN t.prioridade = 'Urgente' THEN 1
	ELSE 0
    END) AS 'Prioridade Urgente'
FROM projetos AS p
LEFT JOIN tarefas AS t ON p.id = t.id_projeto
GROUP BY p.nome, t.prioridade;


-- 2

SELECT r.nome, COUNT(t.id_responsavel_tarefa) AS qtd_tarefas FROM responsaveis AS r
LEFT JOIN tarefas AS t ON r.id = t.id_responsavel_tarefa
GROUP BY r.nome
HAVING COUNT(t.id_responsavel_tarefa) >= 3
ORDER BY r.nome;

-- 3

SELECT p.status, ROUND(AVG(DATEDIFF(t.data_prevista_entrega, p.data_inicio)), 2) AS duracao_media
FROM projetos AS p
JOIN tarefas AS t ON p.id = t.id_projeto
GROUP BY p.status;

-- 4

	SELECT p.nome, r.cargo, COUNT(t.id) AS qtd_tarefas FROM projetos AS p
	JOIN tarefas AS t
	ON p.id = t.id_projeto
	JOIN responsaveis AS r
	ON r.id = t.id_responsavel_tarefa
	WHERE p.status = 'Em Andamento'
	GROUP BY p.nome, r.cargo;
    
