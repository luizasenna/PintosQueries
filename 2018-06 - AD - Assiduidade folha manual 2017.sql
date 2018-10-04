
update faltasfolhamanual as a
inner join funcionarios as f
on f.CHAPA = lpad(a.chapa, 6, '0')
set a.codpessoa = f.CODPESSOA

select * from faltasfolhamanual

delete from faltasfolhamanual

update faltasfolhamanual set lpad(chapa, 6, '0');

  Insert into assiduidade (codpessoa, atraso, chapa, nota, ano, mes, codavaliacao, idusuario)

                  select a.codpessoa as codpessoa,
                         SUM(a.atraso)/60 as atraso,
                        lpad(a.chapa, 6, '0') as chapa,
                          CASE
                              WHEN SUM(a.atraso)/60 BETWEEN 0 AND 1.99    THEN 10
                              WHEN SUM(a.atraso)/60 BETWEEN 2 AND 4     THEN 3
                              WHEN SUM(a.atraso)/60 BETWEEN 4.01 AND 8 	THEN 1
                              WHEN SUM(a.atraso)/60 BETWEEN 8.1 AND 100   THEN 0
                              ELSE 0 END
                           AS	nota,
                          a.Ano as ano,
                          a.Mes as mes,
                          av.CODAVALIACAO as codavaliacao,
                          3 as idusuario
                          from faltasfolhamanual as a              
                  inner join avaliacoes as av on a.ano = YEAR(DATAABERTURA) and a.mes = MONTH(DATAABERTURA)
                  group by a.codpessoa, av.CODAVALIACAO, a.Ano, a.Mes;
                  
                  insert into assiduidade(codpessoa, atraso, chapa, nota, ano, mes, codavaliacao, idusuario)           
                  select p.CODPESSOA as codpessoa,  
                   0 as atraso,  
                   p.CHAPAAVALIADO as chapa,  
                   10 as nota, 
                   YEAR(DATAABERTURA) as ano, 
                   MONTH(DATAABERTURA) as mes,
                   p.CODAVALIACAO as codavaliacao, 
                   3 as idusuario
                  from participantes as p
                  left join assiduidade as a
                  on a.codpessoa = p.CODPESSOA
                  and a.codavaliacao = p.CODAVALIACAO
                  inner join avaliacoes as av 
                  on av.CODCOLIGADA = p.CODCOLIGADA
                  and av.CODAVALIACAO = p.CODAVALIACAO
                  where p.CODAVALIACAO = 48 and a.codpessoa is null;
            
                  select * from assiduidade as a
                  left join nota10 as n
                  on n.codpessoa = a.codpessoa and a.codavaliacao = n.codavaliacao
                  where n.codavaliacao = 37 and n.codpessoa is null;
                  
                  
                  select * from participantes where CODAVALIACAO = 37;
                  
                  select count(*) as total, codpessoa, codavaliacao, nota from assiduidade 
                  
                  group by codpessoa, codavaliacao
                  having total > 1;
                  
                  select * from assiduidade where codpessoa = 578 and codavaliacao = 38