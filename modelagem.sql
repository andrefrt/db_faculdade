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
    curso_id INTEGER REFERENCES curso(curso_id),
    materia_id INTEGER REFERENCES materia(materia_id)
)

CREATE TABLE aluno_curso(
        aluno_curso_id SERIAL PRIMARY KEY,
        aluno_id INTEGER REFERENCES aluno(aluno_id),
        curso_id INTEGER REFERENCES curso(curso_id),
        status BOOLEAN NOT NULL
)

CREATE TABLE professor_materia(
        professor_materia_id SERIAL PRIMARY KEY,
        professor_id INTEGER REFERENCES professor(professor_id),
        materia_id INTEGER REFERENCES materia(materia_id)
)

CREATE TABLE evento(
        evento_id SERIAL PRIMARY KEY,
        evento_nome VARCHAR(100),
        evento_tipo VARCHAR(50),
        evento_data DATE     
)

CREATE TABLE turma (
        turma_codigo INT PRIMARY KEY,
        nota_final NUMERIC(2,1),
        aluno_curso_id INT REFERENCES aluno_curso(aluno_curso_id),
        professor_materia_id INT REFERENCES professor_materia(professor_materia_id)
)
