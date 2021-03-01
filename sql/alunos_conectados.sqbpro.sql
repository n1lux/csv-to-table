<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="/home/n1lux/Projects/merge-csv/alunos_conectados.sqlite3" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="100"/><column_width id="3" width="3394"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,19:mainalunos_selecionados"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="alunos_selecionados" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="98"/><column index="2" value="98"/><column index="3" value="300"/><column index="4" value="300"/><column index="5" value="300"/><column index="6" value="74"/><column index="7" value="54"/><column index="8" value="253"/><column index="9" value="54"/><column index="10" value="241"/><column index="11" value="300"/><column index="12" value="53"/><column index="13" value="126"/><column index="14" value="74"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="endereco_atualizado" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths/><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">select count(*) from alunos_selecionados_cpf_corrigido;
select count(*) from endereco_corrigido;

select cpf from respostas_alunos_atualizacao_cadastral_cpf_corrigido;

select a.cpf from alunos_selecionados_cpf_corrigido a left join respostas_alunos_atualizacao_cadastral_cpf_corrigido c on a.cpf = c.cpf where c.cpf is null;</sql><sql name="20210128">select count(*) from alunos_selecionados;
select count(*) from respostas_alunos_atualizacao_cadastral_cpf_corrigido;
create table alunos_selecionados_cpf_corrigido as select * from alunos_selecionados;

select 
	fa.nome 	
	from 
		final_atualizado fa 
	left join 
		respostas_alunos_atualizacao_cadastral ea on ea.&quot;Matrícula UFVJM&quot; = fa.matricula	
    where ea.&quot;Matrícula UFVJM&quot; is not null;
	
	
	
select * from endereco_atualizado ea inner join final_atualizado fa on fa.cpf=ea.cpf;

select DISTINCT *  from endereco_atualizado;
select count(*) from endereco_atualizado;
select *   from alunos_selecionados;
select cpf from respostas_alunos_atualizacao_cadastral;
select DISTINCT * from final_atualizado;
update respostas_alunos_atualizacao_cadastral_cpf_corrigido set cpf = &quot;0&quot;||cpf where length(cpf) &lt; 11;

select fa.cpf, fa.matricula from final_atualizado fa left join respostas_alunos_atualizacao_cadastral_cpf_corrigido rc on rc.cpf = fa.cpf where rc.cpf is null;
select fa.cpf, fa.matricula from final_atualizado fa left join respostas_alunos_atualizacao_cadastral_cpf_corrigido rc on rc.&quot;Matrícula UFVJM&quot; = fa.matricula where rc.&quot;Matrícula UFVJM&quot; is null;

select * from respostas_alunos_atualizacao_cadastral_cpf_corrigido rc inner join  final_atualizado fa  on fa.cpf = rc.cpf;
select * from respostas_alunos_atualizacao_cadastral_cpf_corrigido rc inner join  final_atualizado fa  on fa.matricula = rc.&quot;Matrícula UFVJM&quot;;

select cpf, &quot;Matrícula UFVJM&quot; from respostas_alunos_atualizacao_cadastral_cpf_corrigido where cpf not in (select cpf from final_atualizado);

update alunos_selecionados_cpf_corrigido set cpf = &quot;0&quot;||cpf where length(cpf) &lt; 11;

select count(*) from alunos_selecionados_cpf_corrigido;
-- 1952

select fa.cpf, fa.matricula from alunos_selecionados_cpf_corrigido fa left join respostas_alunos_atualizacao_cadastral_cpf_corrigido rc on rc.cpf = fa.cpf where rc.cpf is null;

select &quot;Matrícula UFVJM&quot; as matricula, cpf from respostas_alunos_atualizacao_cadastral_cpf_corrigido;</sql><current_tab id="0"/></tab_sql></sqlb_project>
