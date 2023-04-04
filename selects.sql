--SELECT para identificar quais matérias cada aluno está cursando

SELECT aluno_nome, materia_nome
FROM aluno
JOIN aluno_curso ON aluno.aluno_id = aluno_curso.aluno_id
JOIN curso_materia ON aluno_curso.curso_id = curso_materia.curso_id
JOIN materia ON curso_materia.materia_id = materia.materia_id
WHERE aluno_curso.status = true
ORDER BY aluno_nome, materia_nome;
