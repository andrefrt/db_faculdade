CREATE DATABASE db_faculdade

CREATE TABLE aluno(
        aluno_id SERIAL PRIMARY KEY,
        aluno_nome VARCHAR(50) NOT NULL,
        aluno_cpf CHAR(11) UNIQUE NOT NULL,
        genero CHAR(1) NOT NULL,
        idade SMALLINT NOT NULL
)

CREATE TABLE professor(
        professor_id SERIAL PRIMARY KEY,
        professor_nome VARCHAR(50) NOT NULL,
        professor_cpf CHAR(11) UNIQUE NOT NULL,
        genero CHAR(1) NOT NULL,
        idade SMALLINT NOT NULL,
        salario NUMERIC(8,2) NOT NULL
)

CREATE TABLE curso(
        curso_id SERIAL PRIMARY KEY,
        curso_codigo SMALLINT UNIQUE,
        curso_nome VARCHAR(100) UNIQUE
)

CREATE TABLE materia(
        materia_id SERIAL PRIMARY KEY,
        materia_nome VARCHAR(100) UNIQUE
)


CREATE TABLE curso_materia (
    curso_materia_id SERIAL PRIMARY KEY,
    curso_id INTEGER UNIQUE REFERENCES curso(curso_id),
    materia_id INTEGER UNIQUE REFERENCES materia(materia_id)
)

CREATE TABLE aluno_curso(
        aluno_curso_id SERIAL PRIMARY KEY,
        aluno_id INTEGER UNIQUE REFERENCES aluno(aluno_id),
        curso_id INTEGER UNIQUE REFERENCES curso(curso_id)
)

CREATE TABLE professor_materia(
        professor_materia_id SERIAL PRIMARY KEY,
        professor_id INTEGER UNIQUE REFERENCES professor(professor_id),
        materia_id INTEGER UNIQUE REFERENCES materia(materia_id)
)

CREATE TABLE status(
        status_id SERIAL PRIMARY KEY,
        status_curso BOOLEAN NOT NULL,
        motivo VARCHAR(500)  
)

CREATE TABLE status_aluno_curso(
        status_aluno_id SERIAL PRIMARY KEY,
        aluno_id INTEGER UNIQUE REFERENCES aluno(aluno_id),
        curso_id INTEGER UNIQUE REFERENCES curso(curso_id),
        status_id INTEGER UNIQUE REFERENCES status(status_id)
)

CREATE TABLE frequencia(
        frequencia_id SERIAL PRIMARY KEY,
        frequencia_total INT,
        frequencia_faltas INT
)

CREATE TABLE frequencia_aluno(
        frequencia_aluno SERIAL PRIMARY KEY,
        frequencias_id INTEGER UNIQUE REFERENCES frequencia(frequencia_id),
        aluno_id INTEGER UNIQUE REFERENCES aluno(aluno_id)
)

CREATE TABLE evento(
        evento_id SERIAL PRIMARY KEY,
        evento_nome VARCHAR(100),
        evento_tipo VARCHAR(50),
        evento_data DATE     
)

CREATE TABLE notas(
        notas_id SERIAL PRIMARY KEY,
        aluno_id INTEGER UNIQUE REFERENCES aluno_curso(aluno_id),
        curso_id INTEGER UNIQUE REFERENCES aluno_curso(curso_id),
        materia_id INTEGER UNIQUE REFERENCES curso_materia(materia_id),
        nota_final NUMERIC(2,1)
)

CREATE TABLE turma(
        turma_id SERIAL PRIMARY KEY,
        turma_codigo INT
)

CREATE TABLE turma_aluno(
        turma_aluno_id SERIAL PRIMARY KEY,
        aluno_id INTEGER UNIQUE REFERENCES aluno_curso(aluno_id),
        turma_id INTEGER UNIQUE REFERENCES turma(turma_id)
)

CREATE TABLE turma_professor(
        turma_professor_id SERIAL PRIMARY KEY,
        professor_id INTEGER UNIQUE REFERENCES professor(professor_id),
        turma_id INTEGER UNIQUE REFERENCES turma(turma_id)
)

CREATE TABLE turma_materia(
        turma_materia_id SERIAL PRIMARY KEY,
        materia_id INTEGER UNIQUE REFERENCES curso_materia(materia_id),
        turma_id INTEGER UNIQUE REFERENCES turma(turma_id)
)
