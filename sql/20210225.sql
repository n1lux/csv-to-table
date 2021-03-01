
respostas_alunos_atualizacao_cadastral_cpf_corrigidocreate table alunos_chips_enviados_20210225 as select * from cidade_uf_atualizado as ca where ca.cpf in (select cpf from alunos_selecionados_cpf_corrigido);

select cpf from alunos_selecionados_cpf_corrigido;

select * from cidade_uf_atualizado;

select cpf from alunos_selecionados_cpf_corrigido where length(cpf) < 11;



-- update alunos_selecionados_cpf_corrigido set cpf = "0"||cpf where length(cpf) < 11;

-- select * from cidade_uf_atualizado where cpf in ("12818834686",
-- "13462624628",
-- "70014066602",
-- "01908874600",
-- "14396002602",
-- "14576887602"
-- )

select * from atualizados_selecionou_operadora  where length(cpf) > 11;
-- update respostas_alunos_atualizacao_cadastral_cpf_corrigido set cpf="10677331673" where cpf="106777331673";

select * from respostas_alunos_atualizacao_cadastral_cpf_corrigido where cpf in (select cpf from atualizados_selecionou_operadora);

select * from (
	select 
		ra."Carimbo de data/hora",
		ra."Endereço de e-mail",
		ra."Telefone (*incluindo o DDD)", 
		ra."Matrícula UFVJM", 
		ra."CPF", 
		ra."Informe o endereço onde vai estudar de forma remota. (ex. Rua 13 de maio)" || "," || ra."Informe o numero da residência onde vai estudar de forma remota. (ex. 275, 275B)" as "Endereco",
		ra."Informe o bairro onde vai estudar de forma remota. (ex. Amoreiras)", 
		ra."Informe o CEP  referente ao endereço onde vai estudar de forma remota. (ex. 37701000)",	
		ao."Selecione a operadora que fornece conexão de dados no local que estudará de forma remota." 

		from respostas_alunos_atualizacao_cadastral_cpf_corrigido ra inner join alunos_formulario_operadora ao on ao.cpf = ra.cpf
	UNION
	select 
		ra."Carimbo de data/hora",
		ra."Endereço de e-mail",
		ra."Telefone (*incluindo o DDD)", 
		ra."Matrícula UFVJM", 
		ra."CPF", 
		ra."Informe o nome da rua onde vai estudar de forma remota. (ex. Rua 13 de maio)" || "," || ra."Informe o numero da residência onde vai estudar de forma remota. (ex. 275, 275B)" as "Endereco",		
		ra."Informe o bairro onde vai estudar de forma remota. (ex. Amoreiras)", 
		ra."Informe o CEP  referente ao endereço onde vai estudar de forma remota. (ex. 37701000)",	
		ra. "Selecione a operadora que fornece conexão de dados no local que estudará de forma remota."
		from atualizaram_endereco_formulario_2 as ra
)as consolidado where consolidado.cpf in (select cpf from alunos_selecionados_cpf_corrigido);

select * from alunos_formulario_operadora;