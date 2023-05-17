
As tabelas estão com padrão tb_nomeTabela (plural)
Os campos seguem o padrão nomeDoCampo_nomeDaTabela (singular)
Basta importar o banco de dados, já está com o "create database"

tb_alunos
- chave primaria (id_aluno)
- nome do aluno (nome_aluno)

tb_atividades
- chave primaria (id_atividade)
- nome da atividade nome_atividade
- nota da atividade nota_atividade

tb_boletins
- chave primaria (id_boletim)
- fk do aluno (fk_aluno)
- fk da atividade (fk_atividade)
 
tb_professores
- chave primaria (id_professor)
- nome (nome_professor)

tb_regras
- chave primaria (id_regra)
- formula da regra (formula_regra)
- fk do professor (fk_professor)
