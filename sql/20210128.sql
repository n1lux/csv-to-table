select 
	fa.nome 	
	from 
		final_atualizado fa 
	left join 
		respostas_alunos_atualizacao_cadastral ea on ea."Matrícula UFVJM" = fa.matricula	
    where ea."Matrícula UFVJM" is not null;
	
	
	
select * from endereco_atualizado ea inner join final_atualizado fa on fa.cpf=ea.cpf;

select DISTINCT *  from endereco_atualizado;
select count(*) from endereco_atualizado;
select *   from alunos_selecionados;
select cpf from respostas_alunos_atualizacao_cadastral;
select DISTINCT * from final_atualizado;
update respostas_alunos_atualizacao_cadastral_cpf_corrigido set cpf = "0"||cpf where length(cpf) < 11;

select fa.cpf, fa.matricula from final_atualizado fa left join respostas_alunos_atualizacao_cadastral_cpf_corrigido rc on rc.cpf = fa.cpf where rc.cpf is null;
select fa.cpf, fa.matricula from final_atualizado fa left join respostas_alunos_atualizacao_cadastral_cpf_corrigido rc on rc."Matrícula UFVJM" = fa.matricula where rc."Matrícula UFVJM" is null;

select * from respostas_alunos_atualizacao_cadastral_cpf_corrigido rc inner join  final_atualizado fa  on fa.cpf = rc.cpf;
select * from respostas_alunos_atualizacao_cadastral_cpf_corrigido rc inner join  final_atualizado fa  on fa.matricula = rc."Matrícula UFVJM";

select cpf, "Matrícula UFVJM" from respostas_alunos_atualizacao_cadastral_cpf_corrigido where cpf not in (select cpf from final_atualizado);