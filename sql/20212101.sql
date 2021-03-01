SELECT * from final_atualizado;
select * from endereco_atualizado;
select * from alunos_atualizado;

select fa.cpf, fa.municipio, ea.municipio from final_atualizado fa inner join endereco_atualizado ea on ea.cpf = fa.cpf where ea.municipio <> fa.municipio; 


SELECT * from alunos_atualizado;
select * from final;

-- update final_atualizado set cpf = "0"||cpf where length(cpf) < 11;

-- Atualiza o nome municipio bairro cep e endereco buscando da tabela do ecampus


-- update final_atualizado SET
-- 			nome = (select nome from endereco_atualizado where endereco_atualizado.cpf=final_atualizado.cpf),
-- 			municipio = (select municipio from endereco_atualizado where endereco_atualizado.cpf=final_atualizado.cpf),
-- 			bairro = (select bairro from endereco_atualizado where endereco_atualizado.cpf=final_atualizado.cpf),
-- 			cep = (select cep from endereco_atualizado where endereco_atualizado.cpf=final_atualizado.cpf),
-- 			endereco = (select endereco from endereco_atualizado where endereco_atualizado.cpf=final_atualizado.cpf)



-- select f.cpf, fa.cpf, f.nome, fa.nome, f.endereco, fa.endereco, f.municipio, fa.municipio, f.cep, fa.cep, f.bairro, fa.bairro from final f inner join final_atualizado fa on fa.cpf = f.cpf;

-- select 
-- 	a."CPF", 
-- 	a."Matrícula UFVJM",
-- a."Endereço de e-mail",
-- a."Informe o endereço onde vai estudar de forma remota. (ex. Rua 13 de maio)",
-- a."Informe o numero da residência onde vai estudar de forma remota. (ex. 275, 275B)",
-- a."Informe o bairro onde vai estudar de forma remota. (ex. Amoreiras)"
-- 	from alunos_atualizado a

select 
	fa.cpf, 
	fa.cep, 
	aa."Informe o CEP  referente ao endereço onde vai estudar de forma remota. (ex. 37701000)"
	
	from final_atualizado fa inner join alunos_atualizado aa on aa.cpf=fa.cpf 
	where fa.cep <> aa."Informe o CEP  referente ao endereço onde vai estudar de forma remota. (ex. 37701000)";

-- select CASE WHEN length(cpf) < 11 THEN "0"||cpf ELSE cpf END  cpf from final_atualizado;



select * , a."Informe o CEP  referente ao endereço onde vai estudar de forma remota. (ex. 37701000)" as cep from alunos_atualizado a where length(cep) > 8;

select * from 
select * from final_atualizado where cpf = "37156822802"


-- Remove o ultimo caracter para registros com cep com tamanho maior que 8
-- UPDATE final_atualizado SET cep=SUBSTR(cep, 0, LENGTH(cep) - 1) where length(cep) > 8;

select cep from final_atualizado where cep and length(cep) < 8;

select municipio

select * from endereco_corrigido;