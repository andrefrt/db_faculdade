--SELECT para identificar a quantidade de matérias que cada professor leciona

SELECT professor.professor_nome, COUNT(professor_materia.professor_id)
FROM professor
LEFT JOIN professor_materia ON professor.professor_id = professor_materia.professor_id
GROUP BY professor.professor_nome, professor.professor_id
ORDER BY COUNT(professor_materia.professor_id);

--SELECT para identificar o número de alunos com o nome iniciado por vogais e com a idade entre 20 e 23 anos 

SELECT aluno_nome, idade
FROM aluno
WHERE idade BETWEEN 20 AND 23
AND aluno_nome ILIKE 'a%' OR aluno_nome ILIKE 'e%' OR aluno_nome ILIKE 'i%' OR aluno_nome ILIKE 'o%' OR aluno_nome ILIKE 'u%';

--SELECT para identificar a média salarial dos professores

SELECT AVG(salario) AS media_salarial
FROM professor;

--SELECT para identificar o cpf de cada aluna

SELECT aluno_cpf, genero
FROM aluno
WHERE genero = 'F';

--SELECT para identificar quais matérias cada aluno está cursando

SELECT aluno_nome, materia_nome
FROM aluno
JOIN aluno_curso ON aluno.aluno_id = aluno_curso.aluno_id
JOIN curso_materia ON aluno_curso.curso_id = curso_materia.curso_id
JOIN materia ON curso_materia.materia_id = materia.materia_id
WHERE aluno_curso.status = true
ORDER BY aluno_nome, materia_nome;

--SELECT para identificar nome, curso e matéria cursada por todos os alunos

SELECT aluno.aluno_nome, curso.curso_nome, materia.materia_nome
FROM aluno
JOIN aluno_curso ON aluno.aluno_id = aluno_curso.aluno_id
JOIN curso ON aluno_curso.curso_id = curso.curso_id
JOIN curso_materia ON curso.curso_id = curso_materia.curso_id
JOIN materia ON curso_materia.materia_id = materia.materia_id
//para verificar apenas os alunos ativo nos cursos ->
WHERE aluno_curso.status = true
