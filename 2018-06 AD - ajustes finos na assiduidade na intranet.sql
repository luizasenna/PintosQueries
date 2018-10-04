select * from licencas where CHAPA = '050943';

select * from licenciados where CHAPAVALIADO = '050943';

delete from participantes where CHAPAAVALIADO = '050943' and CODAVALIACAO > 50;

                        create table notas_temp_todas
        					(index PARTICIPANTE(PARTICIPANTE), index CODPESSOA(CODPESSOA))
        					select
        				   N.CODITEMAVAL   AS ITEM,
        					S.NOME           AS NOMECOMPETENCIA,
        					NOTAAVALIADOR    AS NOTAAVALIADOR,
        					P.CHAPAAVALIADO  AS CHAPA,
        					N.CODAVALIACAO   AS AVALIACAO,
        					V.NOME           AS DESCRICAO,
        					V.DATAABERTURA   AS DATA, P.CODPARTICIPANTE, P.CODAVALIACAO,
        					N.COMENTARIO     AS OBS,
        					date_format(N.created_at, "%d/%m/%Y")  AS FEITAEM,
        					F.NOME           AS NOME,
        					FUN.NOME        AS FUNCAO,
        					N.CODPARTICIPANTE  AS PARTICIPANTE,
        					LIDER.NOME   AS AVALIADOR,
        					F.CODPESSOA        AS CODPESSOA
        					from notas AS N
        					inner join participantes AS P
                                on N.CODAVALIACAO = P.CODAVALIACAO
                                and N.CODPARTICIPANTE = P.CODPARTICIPANTE
                                and N.CODCOLIGADA = P.CODCOLIGADA
        					inner JOIN competencias AS S ON N.CODITEMAVAL = S.CODCOMPETENCIA
        					inner JOIN avaliacoes AS  V
                                ON V.CODAVALIACAO = N.CODAVALIACAO
                                and V.CODCOLIGADA = N.CODCOLIGADA
        					inner JOIN veravaliacoes AS VAV on V.CODAVALIACAO = VAV.codigoavaliacao
        					LEFT JOIN funcionarios AS F on F.CODPESSOA = P.CODPESSOA
        					LEFT JOIN funcionarios AS LIDER ON LIDER.CODPESSOA = F.CODEQUIPE
        					left JOIN funcoes AS FUN ON FUN.CODIGO = F.CODFUNCAO
        					where statuslider = 0 and V.DATAABERTURA BETWEEN "2017-01-01" and "2017-02-01"
        					and P.CHAPAAVALIADO = "110189"
        					GROUP BY P.CODPESSOA, P.CODAVALIACAO, N.CODITEMAVAL;
        					
        					select * from avaliacoes;
        					
        					select f.CHAPA as CHAPA,
                            f.NOME as NOME,
                            FUNCAO,
                            f.DATAADMISSAO AS DATAADMISSAO,
                            replace(round(SUM(MEDIA)/COUNT(f.CHAPA),4),".",",") as MEDIA,
                            CASE(f.CODFILIAL)
                            WHEN 1 THEN "PINTOS MAGAZINE"
                            WHEN 3 THEN "PINTOS RIVERSIDE"
                            WHEN 5 THEN "PINTOS RIO BRANCO"
                            WHEN 6 THEN "PINTOS CD1"
                            WHEN 8 THEN "PINTOS CALÇADOS"
                            WHEN 9 THEN "PINTOS FREI SERAFIM"
                            WHEN 10 THEN "PINTOS CD2"
                            WHEN 11 THEN "PINTOS SHOPPING"
                            WHEN 12 THEN "PINTOS RIO POTY" END AS LOJA,
                            f.CODSECAO AS CODSECAO,
                            s.DESCRICAO as SECAO,
                            AVALIADOR AS AVALIADOR,
                            (totais.QTDE) AS TOTAL,
                            (totais.FEITAS) AS FEITAS
                            FROM media2016
                            inner join funcionarios as f on f.CHAPA = media2016.chapa
                            LEFT JOIN secoes as s on s.CODIGO = f.CODSECAO
                            LEFT JOIN totais on totais.CODPESSOA = media2016.CODPESSOA
                            WHERE AVALIACAO between 25 and 36 group by media2016.CODPESSOA order by MEDIA desc;
                            
        				
        				select  from participantes where CODPESSOA = 1517;
        				
        				DROP TABLE notas_temp;
        				create temporary table notas_temp
		            select
				    		N.CODITEMAVAL   AS ITEM,
								S.NOME           AS NOMECOMPETENCIA,
								NOTAAVALIADOR    AS NOTA,
								P.CHAPAAVALIADO  AS CHAPA,
								N.CODAVALIACAO   AS AVALIACAO,
								V.NOME           AS DESCRICAO,
								V.DATAABERTURA   AS DATA, P.CODPARTICIPANTE, P.CODAVALIACAO,
								N.COMENTARIO     AS OBS,
								date_format(N.created_at, "%d/%m/%Y")  AS FEITAEM,
								N.CODPARTICIPANTE  AS PARTICIPANTE,
								P.CHAPAAVALIADOR  AS AVALIADOR,  
								(V.DATAABERTURA)   AS ANO
								from notas AS N
								inner join participantes AS P on N.CODAVALIACAO = P.CODAVALIACAO and N.CODPARTICIPANTE = P.CODPARTICIPANTE
								inner JOIN competencias AS S ON N.CODITEMAVAL = S.CODCOMPETENCIA
								inner JOIN avaliacoes AS  V ON V.CODAVALIACAO = N.CODAVALIACAO
								inner JOIN veravaliacoes AS VAV on V.CODAVALIACAO = VAV.codigoavaliacao
								where statuslider = 0 and P.CHAPAAVALIADO = '030455';
								
								select
						AVALIACAO,
						CHAPA,
						CODPARTICIPANTE,
						DESCRICAO,
						FEITAEM,
						PARTICIPANTE,
						AVALIADOR,
						ANO,
						MAX(IF(ITEM = "01", NOTA, 0)) AS NOTA1,
						MAX(IF(ITEM = "01", OBS, " - "))  AS OBS1,
						MAX(IF(ITEM = "02", NOTA, 0)) AS NOTA2,
						MAX(IF(ITEM = "03", NOTA, 0)) AS NOTA3,
						MAX(IF(ITEM = "04", NOTA, 0)) AS NOTA4,
						MAX(IF(ITEM = "05", NOTA, 0)) AS NOTA5,
						MAX(IF(ITEM = "06", NOTA, 0)) AS NOTA6,
						MAX(IF(ITEM = "07", NOTA, 0)) AS NOTA7,
						MAX(IF(ITEM = "08", NOTA, 0)) AS NOTA8,
						MAX(IF(ITEM = "09", NOTA, 0)) AS NOTA9,
						MAX(IF(ITEM = "10", NOTA, 0)) AS NOTA10,
						MAX(IF(ITEM = "11", NOTA, 0)) AS NOTA11,
						MAX(IF(ITEM = "12", NOTA, 0)) AS NOTA12,
						MAX(IF(ITEM = "13", NOTA, 0)) AS NOTA13,
						MAX(IF(ITEM = "14", NOTA, 0)) AS NOTA14,
						MAX(IF(ITEM = "15", NOTA, 0)) AS NOTA15,
						MAX(IF(ITEM = "02", OBS, " - ")) AS OBS2,
						MAX(IF(ITEM = "03", OBS, " - ")) AS OBS3,
						MAX(IF(ITEM = "04", OBS, " - ")) AS OBS4,
						MAX(IF(ITEM = "05", OBS, " - ")) AS OBS5,
						MAX(IF(ITEM = "06", OBS, " - ")) AS OBS6,
						MAX(IF(ITEM = "07", OBS, " - ")) AS OBS7,
						MAX(IF(ITEM = "08", OBS, " - ")) AS OBS8,
						MAX(IF(ITEM = "09", OBS, " - ")) AS OBS9,
						MAX(IF(ITEM = "10", OBS, " - ")) AS OBS10,
						MAX(IF(ITEM = "11", OBS, " - ")) AS OBS11,
						MAX(IF(ITEM = "12", OBS, " - ")) AS OBS12,
						MAX(IF(ITEM = "13", OBS, " - ")) AS OBS13,
						MAX(IF(ITEM = "14", OBS, " - ")) AS OBS14,
						MAX(IF(ITEM = "15", OBS, " - ")) AS OBS15,
						0 AS MEDIA

						from notas_temp
						GROUP BY AVALIACAO, CHAPA
						ORDER BY AVALIACAO*1;
						
						select YEAR(ANO) AS ANO from notas_temp group by YEAR(ANO);
						select YEAR(ANO) AS ANO from notas_temp group by YEAR(ANO);
						select YEAR(ANO) AS ANO from notas_temp group by YEAR(ANO);
						
						
					drop table 	notas_temp;
					create temporary table notas_temp
		            select
				    		N.CODITEMAVAL   AS ITEM,
								S.NOME           AS NOMECOMPETENCIA,
								NOTAAVALIADOR    AS NOTA,
								P.CHAPAAVALIADO  AS CHAPA,
								N.CODAVALIACAO   AS AVALIACAO,
								V.NOME           AS DESCRICAO,
								V.DATAABERTURA   AS DATA, P.CODPARTICIPANTE, P.CODAVALIACAO,
								N.COMENTARIO     AS OBS,
								date_format(N.created_at, "%d/%m/%Y")  AS FEITAEM,
								N.CODPARTICIPANTE  AS PARTICIPANTE,
								P.CHAPAAVALIADOR  AS AVALIADOR,
								P.CODPESSOA       AS CODPESSOA,
								YEAR(V.DATAABERTURA) AS ANO
								from notas AS N
								inner join participantes AS P on N.CODAVALIACAO = P.CODAVALIACAO and N.CODPARTICIPANTE = P.CODPARTICIPANTE
								inner JOIN competencias AS S ON N.CODITEMAVAL = S.CODCOMPETENCIA
								inner JOIN avaliacoes AS  V ON V.CODAVALIACAO = N.CODAVALIACAO
								inner JOIN veravaliacoes AS VAV on V.CODAVALIACAO = VAV.codigoavaliacao
								where statuslider = 0 and P.CHAPAAVALIADO = '030455'	;
								
								select
						AVALIACAO,
						notas_temp.CHAPA,
						CODPARTICIPANTE,
						DESCRICAO,
						FEITAEM,
						PARTICIPANTE,
						AVALIADOR,
						notas_temp.ANO AS ANO,
						MAX(IF(ITEM = "01", notas_temp.NOTA, 0)) AS NOTA1,
						MAX(IF(ITEM = "01", OBS, " - "))  AS OBS1,
						MAX(IF(ITEM = "02", notas_temp.NOTA, 0)) AS NOTA2,
						CASE
						WHEN (AE.atraso) BETWEEN "0" AND "1,99"    THEN 10
						WHEN (AE.atraso) BETWEEN "2,0" AND "4"     THEN 3
						WHEN (AE.atraso) BETWEEN "4,01" AND "8" 	 THEN 1
						WHEN (AE.atraso) BETWEEN "8,1" AND "100"   THEN 0
						ELSE 0 END
						AS	  	                        NOTA3,
						MAX(IF(ITEM = "04", notas_temp.NOTA, 0)) AS NOTA4,
						MAX(IF(ITEM = "05", notas_temp.NOTA, 0)) AS NOTA5,
						MAX(IF(ITEM = "06", notas_temp.NOTA, 0)) AS NOTA6,
						MAX(IF(ITEM = "07", notas_temp.NOTA, 0)) AS NOTA7,
						MAX(IF(ITEM = "08", notas_temp.NOTA, 0)) AS NOTA8,
						MAX(IF(ITEM = "09", notas_temp.NOTA, 0)) AS NOTA9,
						MAX(IF(ITEM = "10", notas_temp.NOTA, 0)) AS NOTA10,
						MAX(IF(ITEM = "11", notas_temp.NOTA, 0)) AS NOTA11,
						MAX(IF(ITEM = "12", notas_temp.NOTA, 0)) AS NOTA12,
						MAX(IF(ITEM = "13", notas_temp.NOTA, 0)) AS NOTA13,
						MAX(IF(ITEM = "14", notas_temp.NOTA, 0)) AS NOTA14,
						MAX(IF(ITEM = "15", notas_temp.NOTA, 0)) AS NOTA15,
						MAX(IF(ITEM = "02", OBS, " - ")) AS OBS2,
						MAX(IF(ITEM = "03", OBS, " - ")) AS OBS3,
						MAX(IF(ITEM = "04", OBS, " - ")) AS OBS4,
						MAX(IF(ITEM = "05", OBS, " - ")) AS OBS5,
						MAX(IF(ITEM = "06", OBS, " - ")) AS OBS6,
						MAX(IF(ITEM = "07", OBS, " - ")) AS OBS7,
						MAX(IF(ITEM = "08", OBS, " - ")) AS OBS8,
						MAX(IF(ITEM = "09", OBS, " - ")) AS OBS9,
						MAX(IF(ITEM = "10", OBS, " - ")) AS OBS10,
						MAX(IF(ITEM = "11", OBS, " - ")) AS OBS11,
						MAX(IF(ITEM = "12", OBS, " - ")) AS OBS12,
						MAX(IF(ITEM = "13", OBS, " - ")) AS OBS13,
						MAX(IF(ITEM = "14", OBS, " - ")) AS OBS14,
						MAX(IF(ITEM = "15", OBS, " - ")) AS OBS15,
						0 AS MEDIA

						from notas_temp
						left join assiduidade AS AE on AE.codpessoa = notas_temp.CODPESSOA AND AE.codavaliacao = notas_temp.AVALIACAO
						GROUP BY AVALIACAO, CHAPA
						ORDER BY AVALIACAO*1;
						
						select DISTINCT (ANO) 
																from notas_temp group by (ANO);
																
						select * from notas_temp; 
						
						
						update licenciados as lic
						inner join funcionarios as f 
						on f.CHAPA = lic.CHAPAVALIADO
						set lic.CODPESSOA = f.CODPESSOA;
						
						
						update licencas as lic
						inner join funcionarios as f 
						on f.CHAPA = lic.CHAPA
						set lic.CODPESSOA = f.CODPESSOA;
						
						SELECT YEAR(DATAABERTURA) FROM avaliacoes;
						
						update users as u
						inner join funcionarios as f
						on f.CHAPA = u.chapa
						set u.codpessoa = f.CODPESSOA;
						
						select * from participantes where CODPARTICIPANTE = 59753;
						
							drop table if exists notas_temp_todas;

        			create table notas_temp_todas
        					(index PARTICIPANTE(PARTICIPANTE), index CODPESSOA(CODPESSOA))
        					select
        				   N.CODITEMAVAL   AS ITEM,
        					S.NOME           AS NOMECOMPETENCIA,
        					NOTAAVALIADOR    AS NOTAAVALIADOR,
        					P.CHAPAAVALIADO  AS CHAPA,
        					N.CODAVALIACAO   AS AVALIACAO,
        					V.NOME           AS DESCRICAO,
        					V.DATAABERTURA   AS DATA, P.CODPARTICIPANTE, P.CODAVALIACAO,
        					N.COMENTARIO     AS OBS,
        					date_format(N.created_at, "%d/%m/%Y")  AS FEITAEM,
        					F.NOME           AS NOME,
        					FUN.NOME         AS FUNCAO,
        					N.CODPARTICIPANTE  AS PARTICIPANTE,
        					LIDER.NOME       AS NOMEAVALIADOR,
        					F.CODPESSOA      AS CODPESSOA
        					from notas AS N
        					inner join participantes AS P
                                on N.CODAVALIACAO = P.CODAVALIACAO
                                and N.CODPARTICIPANTE = P.CODPARTICIPANTE
                                and N.CODCOLIGADA = P.CODCOLIGADA
        					inner JOIN competencias AS S ON N.CODITEMAVAL = S.CODCOMPETENCIA
        					inner JOIN avaliacoes AS  V
                                ON V.CODAVALIACAO = N.CODAVALIACAO
                                and V.CODCOLIGADA = N.CODCOLIGADA
        					inner JOIN veravaliacoes AS VAV on V.CODAVALIACAO = VAV.codigoavaliacao
        					LEFT JOIN funcionarios AS F on F.CODPESSOA = P.CODPESSOA
        					LEFT JOIN pessoas AS LIDER ON LIDER.CODIGO = F.CODEQUIPE
        					left JOIN funcoes AS FUN ON FUN.CODIGO = F.CODFUNCAO
        					where statuslider = 0 and V.DATAABERTURA BETWEEN "2016-01-01"  and "2016-12-31" and P.CODPESSOA = 2981
        					 GROUP BY P.CODPESSOA, P.CODAVALIACAO, N.CODITEMAVAL;


                       select * from notas_temp_todas;
                       
                       drop table 	notas_temp_todas;
                       create temporary table notas_temp_todas
        					(index PARTICIPANTE(PARTICIPANTE), index CODPESSOA(CODPESSOA))
        					select
        				   N.CODITEMAVAL   AS ITEM,
        					S.NOME           AS NOMECOMPETENCIA,
        					NOTAAVALIADOR    AS NOTAAVALIADOR,
        					P.CHAPAAVALIADO  AS CHAPA,
        					N.CODAVALIACAO   AS AVALIACAO,
        					V.NOME           AS DESCRICAO,
        					V.DATAABERTURA   AS DATA, P.CODPARTICIPANTE, P.CODAVALIACAO,
        					N.COMENTARIO     AS OBS,
        					date_format(N.created_at, "%d/%m/%Y")  AS FEITAEM,
        					F.NOME           AS NOME,
        					FUN.NOME         AS FUNCAO,
        					N.CODPARTICIPANTE  AS PARTICIPANTE,
        					LIDER.NOME       AS NOMEAVALIADOR,
        					F.CODPESSOA      AS CODPESSOA
        					from notas AS N
        					inner join participantes AS P
                                on N.CODAVALIACAO = P.CODAVALIACAO
                                and N.CODPARTICIPANTE = P.CODPARTICIPANTE
                                and N.CODCOLIGADA = P.CODCOLIGADA
        					inner JOIN competencias AS S ON N.CODITEMAVAL = S.CODCOMPETENCIA
        					inner JOIN avaliacoes AS  V
                                ON V.CODAVALIACAO = N.CODAVALIACAO
                                and V.CODCOLIGADA = N.CODCOLIGADA
        					inner JOIN veravaliacoes AS VAV on V.CODAVALIACAO = VAV.codigoavaliacao
        					LEFT JOIN funcionarios AS F on F.CODPESSOA = P.CODPESSOA
        					LEFT JOIN pessoas AS LIDER ON LIDER.CODIGO = F.CODEQUIPE
        					left JOIN funcoes AS FUN ON FUN.CODIGO = F.CODFUNCAO
        					where statuslider = 0 and V.DATAABERTURA BETWEEN "2017-01-01"  and "2017-12-31"
        					 GROUP BY P.CODPESSOA, P.CODAVALIACAO, N.CODITEMAVAL;
        					 
        					 drop table if exists notasPessoaTodas;
        				     CREATE TEMPORARY TABLE notasPessoaTodas
                        		select
        						AVALIACAO,
        						todasAsNotas.CHAPA AS CHAPA,
        						CODPARTICIPANTE,
        						DESCRICAO,
        						PARTICIPANTE,
        						todasAsNotas.NOMEAVALIADOR as NOMEAVALIADOR,
        						NOME,
        						FUNCAO,
        						todasAsNotas.CODPESSOA AS CODPESSOA,
        						MAX(IF(ITEM = "01", NOTAAVALIADOR, 0)) AS NOTA1,
        						MAX(IF(ITEM = "02", NOTAAVALIADOR, 0)) AS NOTA2,
        						CASE
        						WHEN (AE.atraso) BETWEEN "0" AND "2"       THEN 10
        						WHEN (AE.atraso) BETWEEN "2.01" AND "4"    THEN 3
        						WHEN (AE.atraso) BETWEEN "4.01" AND "7.99" THEN 1
        						WHEN (AE.atraso) BETWEEN "8" AND "20"      THEN 0
        						ELSE 0 END
        						AS	  	                                  NOTA3,
        						MAX(IF(ITEM = "04", NOTAAVALIADOR, 0)) AS NOTA4,
        						MAX(IF(ITEM = "05", NOTAAVALIADOR, 0)) AS NOTA5,
        						MAX(IF(ITEM = "06", NOTAAVALIADOR, 0)) AS NOTA6,
        						MAX(IF(ITEM = "07", NOTAAVALIADOR, 0)) AS NOTA7,
        						MAX(IF(ITEM = "08", NOTAAVALIADOR, 0)) AS NOTA8,
        						MAX(IF(ITEM = "09", NOTAAVALIADOR, 0)) AS NOTA9,
        						MAX(IF(ITEM = "10", NOTAAVALIADOR, 0)) AS NOTA10,
        						MAX(IF(ITEM = "12", NOTAAVALIADOR, 0)) AS NOTA12,
        						MAX(IF(ITEM = "13", NOTAAVALIADOR, 0)) AS NOTA13,
        						MAX(IF(ITEM = "14", NOTAAVALIADOR, 0)) AS NOTA14,
        						MAX(IF(ITEM = "15", NOTAAVALIADOR, 0)) AS NOTA15
         						from notas_temp_todas as todasAsNotas
        						left join assiduidade AS AE on AE.codpessoa = todasAsNotas.CODPESSOA 
        						AND AE.codavaliacao = todasAsNotas.AVALIACAO
                                where NOTA != 0
        						GROUP BY AVALIACAO, CODPESSOA
        						ORDER BY AVALIACAO;
        						
        						
        						Drop table if exists feitas;
        				create temporary table feitas
        							     select p.CHAPAAVALIADO     AS CHAPAAVALIADO,
        								   p.CODPESSOA                as CODPESSOA,
        								   f.NOME                     AS NOME,
        								   p.CODAVALIACAO             AS CODAVALIACAO,
        								  (if(n.CODITEMAVAL is not null, 1,0)) as EXISTE
        							from participantes as p
        							inner join funcionarios as f on f.CODPESSOA = p.CODPESSOA
                      inner join avaliacoes as av
                      on av.CODAVALIACAO = p.CODAVALIACAO
                      and av.CODCOLIGADA = p.CODCOLIGADA
        							left join notas as n
                      on n.CODPARTICIPANTE = p.CODPARTICIPANTE
                      and n.CODCOLIGADA = p.CODCOLIGADA
                      and n.CODAVALIACAO = p.CODAVALIACAO
        							where av.DATAABERTURA BETWEEN "2017-01-01"  and "2017-12-31"
        							group by p.CODPESSOA, p.CODAVALIACAO;
        							
        							
        							select * from notasPessoaTodas where CODPESSOA = 1517;
        							
        							
   create temporary table notas_temp
                      select
                      N.CODITEMAVAL   AS ITEM,
                      S.NOME           AS NOMECOMPETENCIA,
                      NOTAAVALIADOR    AS NOTA,
                      P.CHAPAAVALIADO  AS CHAPA,
                      N.CODAVALIACAO   AS AVALIACAO,
                      V.NOME           AS DESCRICAO,
                      V.DATAABERTURA   AS DATA, P.CODPARTICIPANTE, P.CODAVALIACAO,
                      N.COMENTARIO     AS OBS,
                      date_format(N.created_at, "%d/%m/%Y")  AS FEITAEM,
                      N.CODPARTICIPANTE  AS PARTICIPANTE,
                      LIDER.NOME      AS AVALIADOR,
                      F.CODPESSOA     AS CODPESSOA,
                      YEAR(V.DATAABERTURA) AS ANO
                      from notas AS N
                      inner join participantes AS P on N.CODAVALIACAO = P.CODAVALIACAO and N.CODPARTICIPANTE = P.CODPARTICIPANTE
                      inner JOIN competencias AS S ON N.CODITEMAVAL = S.CODCOMPETENCIA
                      inner JOIN avaliacoes AS  V ON V.CODAVALIACAO = N.CODAVALIACAO
                      inner JOIN veravaliacoes AS VAV on V.CODAVALIACAO = VAV.codigoavaliacao
                      inner JOIN funcionarios AS F ON F.CHAPA = P.CHAPAAVALIADO
                      INNER JOIN funcionarios as LIDER ON LIDER.CHAPA = P.CHAPAAVALIADOR
                      where statuslider = 0 and P.CODPESSOA = 4121 and YEAR(V.DATAABERTURA) = 2017
                      
                      select * from notas_temp;
                      
                      
                      select
                              AVALIACAO,
                              notas_temp.CHAPA,
                              CODPARTICIPANTE,
                              DESCRICAO,
                              FEITAEM,
                              PARTICIPANTE,
                              AVALIADOR,
                              notas_temp.CODPESSOA,
                              notas_temp.ANO AS ANO,
                              MAX(IF(ITEM = "01", notas_temp.NOTA, 0)) AS NOTA1,
                              MAX(IF(ITEM = "01", OBS, ""))  AS OBS1,
                              MAX(IF(ITEM = "02", notas_temp.NOTA, 0)) AS NOTA2,
                              CASE
                              WHEN (AE.atraso) BETWEEN "0" AND "1,99"    THEN 10
                              WHEN (AE.atraso) BETWEEN "2,0" AND "4"     THEN 3
                              WHEN (AE.atraso) BETWEEN "4,01" AND "8" 	       THEN 1
                              WHEN (AE.atraso) BETWEEN "8,1" AND "100"     THEN 0
                              ELSE 0 END
                              AS	  	                        NOTA3,
                              MAX(IF(ITEM = "04", notas_temp.NOTA, 0)) AS NOTA4,
                              MAX(IF(ITEM = "05", notas_temp.NOTA, 0)) AS NOTA5,
                              MAX(IF(ITEM = "06", notas_temp.NOTA, 0)) AS NOTA6,
                              MAX(IF(ITEM = "07", notas_temp.NOTA, 0)) AS NOTA7,
                              MAX(IF(ITEM = "08", notas_temp.NOTA, 0)) AS NOTA8,
                              MAX(IF(ITEM = "09", notas_temp.NOTA, 0)) AS NOTA9,
                              MAX(IF(ITEM = "10", notas_temp.NOTA, 0)) AS NOTA10,
                              MAX(IF(ITEM = "11", notas_temp.NOTA, 0)) AS NOTA11,
                              MAX(IF(ITEM = "12", notas_temp.NOTA, 0)) AS NOTA12,
                              MAX(IF(ITEM = "13", notas_temp.NOTA, 0)) AS NOTA13,
                              MAX(IF(ITEM = "14", notas_temp.NOTA, 0)) AS NOTA14,
                              MAX(IF(ITEM = "15", notas_temp.NOTA, 0)) AS NOTA15,
                              MAX(IF(ITEM = "02", OBS, "")) AS OBS2,
                              MAX(IF(ITEM = "03", OBS, "")) AS OBS3,
                              MAX(IF(ITEM = "04", OBS, "")) AS OBS4,
                              MAX(IF(ITEM = "05", OBS, "")) AS OBS5,
                              MAX(IF(ITEM = "06", OBS, "")) AS OBS6,
                              MAX(IF(ITEM = "07", OBS, "")) AS OBS7,
                              MAX(IF(ITEM = "08", OBS, "")) AS OBS8,
                              MAX(IF(ITEM = "09", OBS, "")) AS OBS9,
                              MAX(IF(ITEM = "10", OBS, "")) AS OBS10,
                              MAX(IF(ITEM = "11", OBS, "")) AS OBS11,
                              MAX(IF(ITEM = "12", OBS, "")) AS OBS12,
                              MAX(IF(ITEM = "13", OBS, "")) AS OBS13,
                              MAX(IF(ITEM = "14", OBS, "")) AS OBS14,
                              MAX(IF(ITEM = "15", OBS, "")) AS OBS15,
                              0 AS MEDIA
                              from notas_temp
                              left join assiduidade AS AE on AE.codpessoa = notas_temp.CODPESSOA AND AE.codavaliacao = notas_temp.AVALIACAO
                              GROUP BY AVALIACAO, CHAPA
                              ORDER BY AVALIACAO;
                              
                              select E.NOME AS NOME,
                        E.CODPESSOA AS CHAPA,
                        E.DATAADMISSAO AS DATAADMISSAO,
                        C.NOME AS CARGO,
                        I.IMAGEM AS IMAGEM,
                        Q.DESCRICAO AS LIDER,
                        E.CODFILIAL AS FILIAL,
                        SC.CODIGO   AS CODSECAO,
                        SC.DESCRICAO AS NOMESECAO
                        from funcionarios as E
                        left join funcoes AS C on C.CODIGO = E.CODFUNCAO
                        left join pessoas AS P on P.CODIGO = E.CODPESSOA
                        left join fotos AS I on P.IDIMAGEM = I.IDIMAGEM
                        left join secoes as SC on E.CODSECAO = SC.CODIGO
                        inner join equipes as Q ON Q.CODCLIENTE = E.CODEQUIPE
                        where E.CODPESSOA = 4121
                        group by E.CODPESSOA;
                        
                        
                        select * from mediageralano;
                        
                        drop table notas_temp_todas;
                        create temporary table notas_temp_todas
        					(index PARTICIPANTE(PARTICIPANTE), index CODPESSOA(CODPESSOA))
        					select
        				   N.CODITEMAVAL   AS ITEM,
        					S.NOME           AS NOMECOMPETENCIA,
        					NOTAAVALIADOR    AS NOTAAVALIADOR,
        					P.CHAPAAVALIADO  AS CHAPA,
        					N.CODAVALIACAO   AS AVALIACAO,
        					V.NOME           AS DESCRICAO,
        					V.DATAABERTURA   AS DATA, P.CODPARTICIPANTE, P.CODAVALIACAO,
        					N.COMENTARIO     AS OBS,
        					date_format(N.created_at, "%d/%m/%Y")  AS FEITAEM,
        					F.NOME           AS NOME,
        					FUN.NOME         AS FUNCAO,
        					FUN.CODIGO       AS CODFUNCAO,
        					N.CODPARTICIPANTE  AS PARTICIPANTE,
        					LIDER.NOME       AS NOMEAVALIADOR,
        					F.CODPESSOA      AS CODPESSOA
        					from notas AS N
        					inner join participantes AS P
                                on N.CODAVALIACAO = P.CODAVALIACAO
                                and N.CODPARTICIPANTE = P.CODPARTICIPANTE
                                and N.CODCOLIGADA = P.CODCOLIGADA
        					inner JOIN competencias AS S ON N.CODITEMAVAL = S.CODCOMPETENCIA
        					inner JOIN avaliacoes AS  V
                                ON V.CODAVALIACAO = N.CODAVALIACAO
                                and V.CODCOLIGADA = N.CODCOLIGADA
        					inner JOIN veravaliacoes AS VAV on V.CODAVALIACAO = VAV.codigoavaliacao
        					LEFT JOIN funcionarios AS F on F.CODPESSOA = P.CODPESSOA
        					LEFT JOIN pessoas AS LIDER ON LIDER.CODIGO = F.CODEQUIPE
        					left JOIN funcoes AS FUN ON FUN.CODIGO = F.CODFUNCAO
        					where statuslider = 0 and V.DATAABERTURA BETWEEN "2017-01-01"  and "2017-12-31"
        					AND F.CODSITUACAO <> 'D'
        					and P.CODPESSOA = 167
        					GROUP BY P.CODPESSOA, P.CODAVALIACAO, N.CODITEMAVAL
                        
               drop table notasPessoaTodas         ;
                cREATE TEMPORARY TABLE notasPessoaTodas
                        		select
        						AVALIACAO,
        						todasAsNotas.CHAPA AS CHAPA,
        						CODPARTICIPANTE,
        						DESCRICAO,
        						PARTICIPANTE,
        						todasAsNotas.NOMEAVALIADOR as NOMEAVALIADOR,
        						todasAsNotas.NOME,
        						todasAsNotas.FUNCAO,
        						codcargo,
        						todasAsNotas.CODPESSOA AS CODPESSOA,
        						MAX(IF(ITEM = "01" AND c1 = 0, NOTAAVALIADOR, null)) AS NOTA1,
        						MAX(IF(ITEM = "02" AND c2 = 0, NOTAAVALIADOR, null)) AS NOTA2,
        						CASE
        						WHEN (AE.atraso) BETWEEN 0 AND 2       THEN 10
        						WHEN (AE.atraso) BETWEEN 2.01 AND 4    THEN 3
        						WHEN (AE.atraso) BETWEEN 4.01 AND 7.99 THEN 1
        						WHEN (AE.atraso) BETWEEN 8 AND 20      THEN 0
        						ELSE 0 END
        						AS	  	                                  NOTA3,
        						MAX(IF(ITEM = "04" AND c4 = 0, NOTAAVALIADOR, null)) AS NOTA4,
        						MAX(IF(ITEM = "05" AND c5 = 0, NOTAAVALIADOR, null)) AS NOTA5,
        						MAX(IF(ITEM = "06" AND c6 = 0, NOTAAVALIADOR, null)) AS NOTA6,
        						MAX(IF(ITEM = "07" AND c7 = 0, NOTAAVALIADOR, null)) AS NOTA7,
        						MAX(IF(ITEM = "08" AND c8 = 0, NOTAAVALIADOR, null)) AS NOTA8,
        						MAX(IF(ITEM = "09" AND c9 = 0, NOTAAVALIADOR, null)) AS NOTA9,
        						MAX(IF(ITEM = "10" AND c10 = 0, NOTAAVALIADOR, null)) AS NOTA10,
        						MAX(IF(ITEM = "12" AND c12 = 0, NOTAAVALIADOR, null)) AS NOTA12,
        						MAX(IF(ITEM = "13" AND c13 = 0, NOTAAVALIADOR, null)) AS NOTA13,
        						MAX(IF(ITEM = "14" AND c14 = 0, NOTAAVALIADOR, null)) AS NOTA14,
        						MAX(IF(ITEM = "15" AND c15 = 0, NOTAAVALIADOR, null)) AS NOTA15
         						from notas_temp_todas as todasAsNotas
        						left join assiduidade AS AE on AE.codpessoa = todasAsNotas.CODPESSOA AND AE.codavaliacao = todasAsNotas.AVALIACAO
                                inner join vercargos as VC ON VC.codcargo = todasAsNotas.CODFUNCAO
        						GROUP BY AVALIACAO, CODPESSOA
        						ORDER BY AVALIACAO
        						
        						select * from notasPessoaTodas;
        						select * from vercargos where codcargo = "F010";
        						
        						select * from notasPessoaTodas order by CODPESSOA;
        						
        						drop table if exists feitas;
        						create temporary table feitas
                           select p.CHAPAAVALIADO     AS CHAPAAVALIADO,
                           p.CODPESSOA                as CODPESSOA,
                           f.NOME                     AS NOME,
                           p.CODAVALIACAO             AS CODAVALIACAO,
                          (if(n.CODITEMAVAL is not null, 1,0)) as EXISTE
                      from participantes as p
                      inner join funcionarios as f on f.CODPESSOA = p.CODPESSOA
                      inner join avaliacoes as av
                      on av.CODAVALIACAO = p.CODAVALIACAO
                      and av.CODCOLIGADA = p.CODCOLIGADA
                      left join notas as n
                      on n.CODPARTICIPANTE = p.CODPARTICIPANTE
                      and n.CODCOLIGADA = p.CODCOLIGADA
                      and n.CODAVALIACAO = p.CODAVALIACAO
                      where av.DATAABERTURA BETWEEN "2017-01-01"  and "2017-12-31" and p.CHAPAAVALIADO = '110189'
                      group by p.CODPESSOA, p.CODAVALIACAO;
                      
                      select * from feitas;
                      
                      DROP TABLE if exists totais;
                      Create temporary table totais
              							select count(AVALIACAO) AS QTDE, CODPESSOA, NOME from mediageralano GROUP BY CODPESSOA;
              							
              							SELECT * FROM totais;
              							
              			select f.CHAPA as CHAPA,
        				f.NOME as NOME,
        				FUNCAO,
        				f.DATAADMISSAO AS DATAADMISSAO,
        				sum(MEDIA)/QTDE as MEDIA,
        				CASE(f.CODFILIAL)
        				WHEN 1 THEN "PINTOS MAGAZINE"
        				WHEN 3 THEN "PINTOS RIVERSIDE"
        				WHEN 5 THEN "PINTOS RIO BRANCO"
        				WHEN 6 THEN "PINTOS CD1"
        				WHEN 8 THEN "PINTOS CALÇADOS"
        				WHEN 9 THEN "PINTOS FREI SERAFIM"
        				WHEN 10 THEN "PINTOS CD2"
        				WHEN 11 THEN "PINTOS SHOPPING"
        				WHEN 12 THEN "PINTOS RIO POTY" END AS LOJA,
        				f.CODSECAO AS CODSECAO,
        				s.DESCRICAO as SECAO,
        				AVALIADOR,
        				(totais.QTDE) AS TOTAL,
                (totais.QTDE) AS FEITAS
        				FROM mediageralano
        				left join funcionarios as f on f.CODPESSOA = mediageralano.CODPESSOA
                left join avaliacoes as av
                on av.CODAVALIACAO = AVALIACAO
        				LEFT JOIN secoes as s on s.CODIGO = f.CODSECAO
        				LEFT JOIN totais on totais.CODPESSOA = mediageralano.CODPESSOA
        				WHERE av.DATAABERTURA BETWEEN "2017-01-01"  and "2017-12-31"
        				and f.CODSITUACAO <> 'D' 
                group by mediageralano.CODPESSOA order by AVALIADOR, MEDIA desc;
                
                select * from notasPessoaTodas order by CODPESSOA;
                select * from mediageralano;
                
                select CODFUNCAO from funcionarios where CHAPA = '110189';
                
                create temporary table notas_temp_todas
        					(index PARTICIPANTE(PARTICIPANTE), index CODPESSOA(CODPESSOA))
        					select
        				   N.CODITEMAVAL   AS ITEM,
        					S.NOME           AS NOMECOMPETENCIA,
        					NOTAAVALIADOR    AS NOTAAVALIADOR,
        					P.CHAPAAVALIADO  AS CHAPA,
        					N.CODAVALIACAO   AS AVALIACAO,
        					V.NOME           AS DESCRICAO,
        					V.DATAABERTURA   AS DATA, P.CODPARTICIPANTE, P.CODAVALIACAO,
        					N.COMENTARIO     AS OBS,
        					date_format(N.created_at, "%d/%m/%Y")  AS FEITAEM,
        					F.NOME           AS NOME,
        					FUN.NOME         AS FUNCAO,
                  FUN.CODIGO       AS CODFUNCAO,
        					N.CODPARTICIPANTE  AS PARTICIPANTE,
        					LIDER.NOME       AS NOMEAVALIADOR,
        					F.CODPESSOA      AS CODPESSOA
        					from notas AS N
        					inner join participantes AS P
                                on N.CODAVALIACAO = P.CODAVALIACAO
                                and N.CODPARTICIPANTE = P.CODPARTICIPANTE
                                and N.CODCOLIGADA = P.CODCOLIGADA
        					inner JOIN competencias AS S ON N.CODITEMAVAL = S.CODCOMPETENCIA
        					inner JOIN avaliacoes AS  V
                                ON V.CODAVALIACAO = N.CODAVALIACAO
                                and V.CODCOLIGADA = N.CODCOLIGADA
        					inner JOIN veravaliacoes AS VAV on V.CODAVALIACAO = VAV.codigoavaliacao
        					LEFT JOIN funcionarios AS F on F.CODPESSOA = P.CODPESSOA
        					LEFT JOIN pessoas AS LIDER ON LIDER.CODIGO = F.CODEQUIPE
        					left JOIN funcoes AS FUN ON FUN.CODIGO = F.CODFUNCAO
        					where statuslider = 0 and V.DATAABERTURA BETWEEN "2017-01-01"  and "2017-12-31"
                  and P.CODPESSOA = 167
        					GROUP BY P.CODPESSOA, P.CODAVALIACAO, N.CODITEMAVAL;
        					
        					
        		CREATE TEMPORARY TABLE notasPessoaTodas
                        		  select
                  						AVALIACAO,
                  						todasAsNotas.CHAPA AS CHAPA,
                  						CODPARTICIPANTE,
                  						DESCRICAO,
                  						PARTICIPANTE,
                  						todasAsNotas.NOMEAVALIADOR as NOMEAVALIADOR,
                  						todasAsNotas.NOME,
                  						todasAsNotas.FUNCAO,
                              todasAsNotas.CODFUNCAO,
                  						todasAsNotas.CODPESSOA AS CODPESSOA,
                              MAX(IF(ITEM = "01" AND c1 = 0, NOTAAVALIADOR, null)) AS NOTA1,
        						          MAX(IF(ITEM = "02" AND c2 = 0, NOTAAVALIADOR, null)) AS NOTA2,
                  						CASE
                  						WHEN (AE.atraso) BETWEEN 0 AND 2       THEN 10
                  						WHEN (AE.atraso) BETWEEN 2.01 AND 4    THEN 3
                  						WHEN (AE.atraso) BETWEEN 4.01 AND 7.99 THEN 1
                  						WHEN (AE.atraso) BETWEEN 8 AND 20      THEN 0
                  						ELSE 0 END
                  						AS	  	                                                NOTA3,
                              MAX(IF(ITEM = "04" AND c4 = 0, NOTAAVALIADOR, null)) AS NOTA4,
                  						MAX(IF(ITEM = "05" AND c5 = 0, NOTAAVALIADOR, null)) AS NOTA5,
                  						MAX(IF(ITEM = "06" AND c6 = 0, NOTAAVALIADOR, null)) AS NOTA6,
                  						MAX(IF(ITEM = "07" AND c7 = 0, NOTAAVALIADOR, null)) AS NOTA7,
                  						MAX(IF(ITEM = "08" AND c8 = 0, NOTAAVALIADOR, null)) AS NOTA8,
                  						MAX(IF(ITEM = "09" AND c9 = 0, NOTAAVALIADOR, null)) AS NOTA9,
                  						MAX(IF(ITEM = "10" AND c10 = 0, NOTAAVALIADOR, null)) AS NOTA10,
                  						MAX(IF(ITEM = "12" AND c12 = 0, NOTAAVALIADOR, null)) AS NOTA12,
                  						MAX(IF(ITEM = "13" AND c13 = 0, NOTAAVALIADOR, null)) AS NOTA13,
                  						MAX(IF(ITEM = "14" AND c14 = 0, NOTAAVALIADOR, null)) AS NOTA14,
                  						MAX(IF(ITEM = "15" AND c15 = 0, NOTAAVALIADOR, null)) AS NOTA15
                   						from notas_temp_todas as todasAsNotas
                  						left join assiduidade AS AE
                                        on AE.codpessoa = todasAsNotas.CODPESSOA
                                        AND AE.codavaliacao = todasAsNotas.AVALIACAO
                              left join vercargos as VC
                                        on VC.codcargo = todasAsNotas.CODFUNCAO

                  						GROUP BY AVALIACAO, CODPESSOA
                  						ORDER BY AVALIACAO;
                  						
                  						SELECT * FROM funcionarios where codpessoa = 167 and CODSITUACAO = 'D';
                  						
                  						select * from funcoes where CODIGO = 'F010';
                  						SELECT * FROM vercargos where codcargo = 'F010';
                  						
                  						select * from mediageralano where NOME like '%luciana cesar%';
                  						
                  						
                  					create temporary table feitas
 							select p.CHAPAAVALIADO AS CHAPAAVALIADO,
								   p.CODPESSOA as CODPESSOA, 
								   f.NOME AS NOME, 
 								   p.CODAVALIACAO AS CODAVALIACAO,
								  (if(n.CODITEMAVAL is not null, 1,0)) as EXISTE 
 							from participantes as p
 							inner join funcionarios as f on f.CODPESSOA = p.CODPESSOA
							left join notas as n on n.CODPARTICIPANTE = p.CODPARTICIPANTE and n.CODCOLIGADA = p.CODCOLIGADA and n.CODAVALIACAO = p.CODAVALIACAO 
							where f.CODEQUIPE = 371 and p.CODAVALIACAO between 25 and 36
 							group by p.CODPESSOA, p.CODAVALIACAO;
 							
 							Create temporary table totais
 							select count(CODAVALIACAO) AS QTDE, SUM(EXISTE) AS FEITAS, CHAPAAVALIADO,
 				   CODPESSOA, NOME from feitas GROUP BY CODPESSOA;
 							
 							SELECT * FROM feitas; select * from totais;
 							
 							select CODCLIENTE from equipes where DESCRICAO LIKE "%maria da cruz%";
 							
 							create temporary table feitas
							select p.CHAPAAVALIADO AS CHAPAAVALIADO,
								   p.CODPESSOA as CODPESSOA, 
								   f.NOME AS NOME, 
								   p.CODAVALIACAO AS CODAVALIACAO,
								  (if(n.CODITEMAVAL is not null, 1,0)) as EXISTE 
							from participantes as p
							inner join funcionarios as f on f.CODPESSOA = p.CODPESSOA
							left join notas as n on n.CODPARTICIPANTE = p.CODPARTICIPANTE and n.CODCOLIGADA = p.CODCOLIGADA and n.CODAVALIACAO = p.CODAVALIACAO 
							where p.CODAVALIACAO between 25 and 36
							group by p.CODPESSOA, p.CODAVALIACAO;
							
							drop table if exists feitas;
							create temporary table feitas
							select p.CHAPAAVALIADO AS CHAPAAVALIADO,
            								   p.CODPESSOA as CODPESSOA,
            								   f.NOME AS NOME,
            								   p.CODAVALIACAO AS CODAVALIACAO,
            								  (if(n.CODITEMAVAL is not null, 1,0)) as EXISTE
            							from participantes as p
            							inner join funcionarios as f on f.CODPESSOA = p.CODPESSOA
            							left join notas as n on n.CODPARTICIPANTE = p.CODPARTICIPANTE and n.CODCOLIGADA = p.CODCOLIGADA and n.CODAVALIACAO = p.CODAVALIACAO
            							where p.CODAVALIACAO between 25 and 36
            							group by p.CODPESSOA, p.CODAVALIACAO;
            							
            							Drop table if exists totais;
				Create temporary table totais
           select count(CODAVALIACAO) AS QTDE, SUM(EXISTE) AS FEITAS, CHAPAAVALIADO,
				   CODPESSOA, NOME from feitas GROUP BY CODPESSOA;
							
							
							select * from totais;
							
							create temporary table feitas
            							select p.CHAPAAVALIADO AS CHAPAAVALIADO,
            								   p.CODPESSOA as CODPESSOA,
            								   f.NOME AS NOME,
            								   p.CODAVALIACAO AS CODAVALIACAO,
            								  (if(n.CODITEMAVAL is not null, 1,0)) as EXISTE
            							from participantes as p
            							inner join funcionarios as f on f.CODPESSOA = p.CODPESSOA
            							left join notas as n on n.CODPARTICIPANTE = p.CODPARTICIPANTE and n.CODCOLIGADA = p.CODCOLIGADA and n.CODAVALIACAO = p.CODAVALIACAO
            							where p.CODAVALIACAO between 25 and 36
            							group by p.CODPESSOA, p.CODAVALIACAO;
            							
            							
            							Create temporary table totais
           select count(CODAVALIACAO) AS QTDE, SUM(EXISTE) AS FEITAS, CHAPAAVALIADO,
				   CODPESSOA, NOME from feitas GROUP BY CODPESSOA;
				   
				   
				   SELECT * FROM participantes where CHAPAAVALIADO = '110189';
				   
				   drop table if exists notas_temp_todas;
				   create temporary table notas_temp_todas
          					(index PARTICIPANTE(PARTICIPANTE), index CODPESSOA(CODPESSOA))
          					select
          				   N.CODITEMAVAL   AS ITEM,
          					S.NOME           AS NOMECOMPETENCIA,
          					NOTAAVALIADOR    AS NOTAAVALIADOR,
          					P.CHAPAAVALIADO  AS CHAPA,
          					N.CODAVALIACAO   AS AVALIACAO,
          					V.NOME           AS DESCRICAO,
          					V.DATAABERTURA   AS DATA, P.CODPARTICIPANTE, P.CODAVALIACAO,
          					N.COMENTARIO     AS OBS,
          					date_format(N.created_at, "%d/%m/%Y")  AS FEITAEM,
          					F.NOME           AS NOME,
          					FUN.NOME         AS FUNCAO,
                            F.CODFUNCAO       AS CODFUNCAO,
          					N.CODPARTICIPANTE  AS PARTICIPANTE,
          					LIDER.NOME       AS NOMEAVALIADOR,
          					F.CODPESSOA      AS CODPESSOA
          					from notas AS N
          					inner join participantes AS P
                                  on N.CODAVALIACAO = P.CODAVALIACAO
                                  and N.CODPARTICIPANTE = P.CODPARTICIPANTE
                                  and N.CODCOLIGADA = P.CODCOLIGADA
          					inner JOIN competencias AS S ON N.CODITEMAVAL = S.CODCOMPETENCIA
          					inner JOIN avaliacoes AS  V
                                  ON V.CODAVALIACAO = N.CODAVALIACAO
                                  and V.CODCOLIGADA = N.CODCOLIGADA
          					inner JOIN veravaliacoes AS VAV on V.CODAVALIACAO = VAV.codigoavaliacao
          					LEFT JOIN funcionarios AS F on F.CODPESSOA = P.CODPESSOA
          					left JOIN pessoas AS LIDER ON LIDER.CODIGO = F.CODEQUIPE
          					left JOIN funcoes AS FUN ON FUN.CODIGO = F.CODFUNCAO
          					where statuslider = 0 and V.DATAABERTURA BETWEEN "2017-01-01"  and "2017-12-31" 
          					AND P.CHAPAAVALIADO = '110189'
                            and F.CODSITUACAO <> "D"
          					GROUP BY P.CODPESSOA, P.CODAVALIACAO, N.CODITEMAVAL;
          					
          					
            				CREATE TEMPORARY TABLE notasPessoaTodas
                        		  select
                  						AVALIACAO,
                  						todasAsNotas.CHAPA AS CHAPA,
                  						CODPARTICIPANTE,
                  						DESCRICAO,
                  						PARTICIPANTE,
                  						todasAsNotas.NOMEAVALIADOR as NOMEAVALIADOR,
                  						todasAsNotas.NOME,
                  						todasAsNotas.FUNCAO,
                              todasAsNotas.CODFUNCAO,
                  						todasAsNotas.CODPESSOA AS CODPESSOA,
                              MAX(IF(ITEM = "01", NOTAAVALIADOR, null)) AS NOTA1,
        						          MAX(IF(ITEM = "02", NOTAAVALIADOR, null)) AS NOTA2,
                  						CASE
                  						WHEN (AE.atraso) BETWEEN 0 AND 2       THEN 10
                  						WHEN (AE.atraso) BETWEEN 2.01 AND 4    THEN 3
                  						WHEN (AE.atraso) BETWEEN 4.01 AND 8 THEN 1
                  						WHEN (AE.atraso) BETWEEN 8.1 AND 20      THEN 0
                  						ELSE 0 END
                  						AS	  	                                                NOTA3,
                              MAX(IF(ITEM = "04" AND c4 = 0, NOTAAVALIADOR, null)) AS NOTA4,
                  						MAX(IF(ITEM = "05" AND c5 = 0, NOTAAVALIADOR, null)) AS NOTA5,
                  						MAX(IF(ITEM = "06" AND c6 = 0, NOTAAVALIADOR, null)) AS NOTA6,
                  						MAX(IF(ITEM = "07" AND c7 = 0, NOTAAVALIADOR, null)) AS NOTA7,
                  						MAX(IF(ITEM = "08" AND c8 = 0, NOTAAVALIADOR, null)) AS NOTA8,
                  						MAX(IF(ITEM = "09" AND c9 = 0, NOTAAVALIADOR, null)) AS NOTA9,
                  						MAX(IF(ITEM = "10" AND c10 = 0, NOTAAVALIADOR, null)) AS NOTA10,
                  						MAX(IF(ITEM = "12" AND c12 = 0, NOTAAVALIADOR, null)) AS NOTA12,
                  						MAX(IF(ITEM = "13" AND c13 = 0, NOTAAVALIADOR, null)) AS NOTA13,
                  						MAX(IF(ITEM = "14" AND c14 = 0, NOTAAVALIADOR, null)) AS NOTA14,
                  						MAX(IF(ITEM = "15" AND c15 = 0, NOTAAVALIADOR, null)) AS NOTA15
                   						from notas_temp_todas as todasAsNotas
                  						left join assiduidade AS AE
                                        on AE.codpessoa = todasAsNotas.CODPESSOA
                                        AND AE.codavaliacao = todasAsNotas.AVALIACAO
                              left join vercargos as VC
                                        on VC.codcargo = todasAsNotas.CODFUNCAO
                  						GROUP BY AVALIACAO, CODPESSOA
                  						ORDER BY AVALIACAO			;
                  						
                  						drop table if exists feitas;
                  						create temporary table feitas
                           select p.CHAPAAVALIADO     AS CHAPAAVALIADO,
                           p.CODPESSOA                as CODPESSOA,
                           f.NOME                     AS NOME,
                           p.CODAVALIACAO             AS CODAVALIACAO,
                           n.CODITEMAVAL              AS ITEM, 
                           n.NOTAAVALIADOR            AS NOTA,
                          (if(n.CODITEMAVAL is not null, 1,0)) as EXISTE
                      from participantes as p
                      LEFT join funcionarios as f on f.CODPESSOA = p.CODPESSOA
                      LEFT join avaliacoes as av
                      on av.CODAVALIACAO = p.CODAVALIACAO
                      and av.CODCOLIGADA = p.CODCOLIGADA
                      left join notas as n
                      on n.CODPARTICIPANTE = p.CODPARTICIPANTE
                      and n.CODCOLIGADA = p.CODCOLIGADA
                      and n.CODAVALIACAO = p.CODAVALIACAO
                      where av.CODAVALIACAO BETWEEN 25 AND 36 and p.CHAPAAVALIADO = '110189'
                  
            							
					  select count(CODAVALIACAO) AS QTDE, SUM(EXISTE) AS FEITAS, CHAPAAVALIADO,
        				      CODPESSOA, NOME from feitas GROUP BY CODPESSOA		;
        				      
        			select p.CODAVALIACAO, n.NOTAAVALIADOR
        			from participantes as p
        			left join notas as n
        			on n.CODCOLIGADA = p.CODCOLIGADA
        			and n.CODAVALIACAO = p.CODAVALIACAO
        			and n.CODPARTICIPANTE = p.CODPARTICIPANTE
        			where p.CHAPAAVALIADO =  '110189'
        			and p.CODAVALIACAO between 37 and 48
        			group by p.CODAVALIACAO;
        			
        			
        			SELECT * from participantes as p 
        			where p.CHAPAAVALIADO =  '110189' and p.CODAVALIACAO  between 37 and 48
        			group by p.CODAVALIACAO;
        			
        			DELETE a FROM participantes AS a, participantes AS b WHERE a.CODAVALIACAO=b.CODAVALIACAO AND a.id < b.id;
        			
        			select p.CODPESSOA as codpessoa,
                         round((IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0))/60,1) as atraso,
                         at.MINUTOS AS MINUTOS,
                         FALTA AS FALTA, 
                         ab.ABONO AS ABONO,
                         p.CHAPAAVALIADO as chapa,
                          CASE
                              WHEN (IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0))/60 BETWEEN 0 AND 1.99    THEN 10
                              WHEN (IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0))/60 BETWEEN 2 AND 4     THEN 3
                              WHEN (IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0))/60 BETWEEN 4.01 AND 8 	THEN 1
                              WHEN (IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0))/60 BETWEEN 8.1 AND 100   THEN 0
                              ELSE 0 END
                           AS	nota,
                          aval.ANO as ano,
                          aval.MES as mes,
                          aval.CODAVALIACAO as codavaliacao,
                          3 as idusuario
                          from participantes as p 
                          inner join funcionarios as f on f.CODPESSOA = p.CODPESSOA
                          inner join avaliacoes as aval
                          on aval.CODAVALIACAO = p.CODAVALIACAO          
                          left join abonoslancados as ab
                          on ab.CODPESSOA = p.CODPESSOA 
                          and aval.ANO = ab.ANO 
                          and aval.MES = ab.MES  
                          left join atrasosfaltas as at
                          ON at.CODPESSOA = p.CODPESSOA
                          and aval.ANO = at.ANO
                          and aval.MES = at.MES
                          where CODSITUACAO <> 'D' and p.CHAPAAVALIADO = '050900'
                          group by p.CODPESSOA, aval.ANO, aval.MES, p.CODPESSOA
                      
                          
                          
                          UPDATE avaliacoes
                          set ANO = YEAR(DATAABERTURA) AND MES = YEAR(DATAABERTURA);
                          
                        select * from abonoslancados where CODPESSOA = 2690 ;
                        
                        
                          select p.CODPESSOA as codpessoa,
                         round((IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0))/60,1) as atraso,
                         at.MINUTOS AS MINUTOS,
                         FALTA AS FALTA,
                         ab.ABONO AS ABONO,
                         p.CHAPAAVALIADO as chapa,
                          CASE
                              WHEN (IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0))/60 BETWEEN 0 AND 1.99    THEN 10
                              WHEN (IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0))/60 BETWEEN 2 AND 4     THEN 3
                              WHEN (IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0))/60 BETWEEN 4.01 AND 8 	THEN 1
                              WHEN (IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0))/60 BETWEEN 8.1 AND 100   THEN 0
                              ELSE 0 END
                           AS	nota,
                          aval.ANO as ano,
                          aval.MES as mes,
                          aval.CODAVALIACAO as codavaliacao,
                          3 as idusuario
                          from participantes as p
                          inner join funcionarios as f on f.CODPESSOA = p.CODPESSOA
                          inner join avaliacoes as aval
                          on aval.CODAVALIACAO = p.CODAVALIACAO
                          left join abonoslancados as ab
                          on ab.CODPESSOA = p.CODPESSOA
                          and aval.ANO = ab.ANO
                          and aval.MES = ab.MES
                          left join atrasosfaltas as at
                          ON at.CODPESSOA = p.CODPESSOA
                          and aval.ANO = at.ANO
                          and aval.MES = at.MES
                          where CODSITUACAO <> 'D' and  aval.CODAVALIACAO = 38 and p.CODPESSOA = 2690
                          group by p.CODPESSOA, aval.ANO, aval.MES, p.CODPESSOA;
                          
                          SELECT * FROM assiduidade where codpessoa = 2690; 
                          
                          
                          select p.CODPESSOA as codpessoa,
                         round((IFNULL(sum(ffm.atraso)/60,0) + IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO/60,0)),1) as atraso, 
                         p.CHAPAAVALIADO as chapa,
                          CASE
                              WHEN (IFNULL(ffm.atraso/60,0) + IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO/60,0)) BETWEEN 0 AND 1.99    THEN 10
                              WHEN (IFNULL(ffm.atraso/60,0) + IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO/60,0)) BETWEEN 2 AND 4     THEN 3
                              WHEN (IFNULL(ffm.atraso/60,0) + IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO/60,0)) BETWEEN 4.01 AND 8 	THEN 1
                              WHEN (IFNULL(ffm.atraso/60,0) + IFNULL(at.MINUTOS,0) + IFNULL(FALTA,0) + IFNULL(ab.ABONO/60,0)) BETWEEN 8.1 AND 100   THEN 0
                              ELSE 0 END
                           AS	nota,
                          aval.ANO as ano,
                          aval.MES as mes,
                          aval.CODAVALIACAO as codavaliacao,
                          3 as idusuario
                          from participantes as p
                          inner join funcionarios as f on f.CODPESSOA = p.CODPESSOA
                          inner join avaliacoes as aval
                          on aval.CODAVALIACAO = p.CODAVALIACAO
                          left join abonoslancados as ab
                          on ab.CODPESSOA = p.CODPESSOA
                          and aval.ANO = ab.ANO
                          and aval.MES = ab.MES
                          left join atrasosfaltas as at
                          ON at.CODPESSOA = p.CODPESSOA
                          and aval.ANO = at.ANO
                          and aval.MES = at.MES
                          left join faltasfolhamanual as ffm
                          on ffm.codpessoa = p.CODPESSOA
                          AND ffm.Ano = aval.ANO
                          AND ffm.Mes = aval.MES
                          where CODSITUACAO <> 'D' and p.CODPESSOA = 2690
                          group by p.CODPESSOA, aval.ANO, aval.MES, p.CODPESSOA;
                          
                          SELECT * FROM faltasfolhamanual where nome like '%Antonio de Sousa Pereira%';
                          
                          select * from assiduidade where chapa = '050900';
                          
                          select * from faltasfolhamanual where CODPESSOA = 1452;
                          
                          select p.CODPESSOA as codpessoa,
                        (IFNULL(at.MINUTOS,0)/60 + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0)/60) as atraso,
                        p.CHAPAAVALIADO as chapa,
                        ffm.atraso/60,
                        IFNULL(ab.ABONO,0)/60,
                        IFNULL(FALTA,0),
                        IFNULL(at.MINUTOS,0),
                         CASE
                             WHEN (IFNULL(ffm.atraso/60,0) + IFNULL(at.MINUTOS,0)/60 + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0)/60) BETWEEN 0 AND 1.99    THEN 10
                             WHEN (IFNULL(ffm.atraso/60,0) + IFNULL(at.MINUTOS,0)/60 + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0)/60) BETWEEN 2 AND 4     THEN 3
                             WHEN (IFNULL(ffm.atraso/60,0) + IFNULL(at.MINUTOS,0)/60 + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0)/60) BETWEEN 4.01 AND 8 	THEN 1
                             WHEN (IFNULL(ffm.atraso/60,0) + IFNULL(at.MINUTOS,0)/60 + IFNULL(FALTA,0) + IFNULL(ab.ABONO,0)/60) BETWEEN 8.1 AND 100   THEN 0
                             ELSE 0 END
                          AS	nota,
                          aval.ANO as ano,
                          aval.MES as mes,
                          aval.CODAVALIACAO as codavaliacao,
                          3 as idusuario
                          from participantes as p
                          inner join funcionarios as f on f.CODPESSOA = p.CODPESSOA
                          inner join avaliacoes as aval
                          on aval.CODAVALIACAO = p.CODAVALIACAO
                          left join abonoslancados as ab
                          on ab.CODPESSOA = p.CODPESSOA
                          and aval.ANO = ab.ANO
                          and aval.MES = ab.MES
                          left join atrasosfaltas as at
                          ON at.CODPESSOA = p.CODPESSOA
                          and aval.ANO = at.ANO
                          and aval.MES = at.MES
                          left join faltasfolhamanual as ffm
                          on ffm.codpessoa = p.CODPESSOA
                          AND ffm.Ano = aval.ANO
                          AND ffm.Mes = aval.MES
                          where CODSITUACAO <> 'D' and p.CODPESSOA = 2690
                          group by p.CODPESSOA, aval.ANO, aval.MES, p.CODPESSOA;
                          
                            select p.CODPESSOA as codpessoa,
                        round((SUM(IFNULL(ffm.atraso/60,0)) + IFNULL(at.MINUTOS,0)/60 + IFNULL(FALTA,0)/60 + IFNULL(ab.ABONO/60,0)),1) as atraso,
                        p.CHAPAAVALIADO as chapa,
                         CASE
                             WHEN (IFNULL(SUM(ffm.atraso/60),0) + IFNULL(at.MINUTOS,0)/60 + IFNULL(FALTA,0)/60 + IFNULL(ab.ABONO/60,0)) BETWEEN 0 AND 1.99    THEN 10
                             WHEN (IFNULL(SUM(ffm.atraso/60),0) + IFNULL(at.MINUTOS,0)/60 + IFNULL(FALTA,0)/60 + IFNULL(ab.ABONO/60,0)) BETWEEN 2 AND 4     THEN 3
                             WHEN (IFNULL(SUM(ffm.atraso/60),0) + IFNULL(at.MINUTOS,0)/60 + IFNULL(FALTA,0)/60 + IFNULL(ab.ABONO/60,0)) BETWEEN 4.01 AND 8 	THEN 1
                             WHEN (IFNULL(SUM(ffm.atraso/60),0) + IFNULL(at.MINUTOS,0)/60 + IFNULL(FALTA,0)/60 + IFNULL(ab.ABONO/60,0)) BETWEEN 8.1 AND 100   THEN 0
                             ELSE 0 END
                          AS	nota,
                          aval.ANO as ano,
                          aval.MES as mes,
                          aval.CODAVALIACAO as codavaliacao,
                          3 as idusuario
                          from participantes as p
                          inner join funcionarios as f on f.CODPESSOA = p.CODPESSOA
                          inner join avaliacoes as aval
                          on aval.CODAVALIACAO = p.CODAVALIACAO
                          left join abonoslancados as ab
                          on ab.CODPESSOA = p.CODPESSOA
                          and aval.ANO = ab.ANO
                          and aval.MES = ab.MES
                          left join atrasosfaltas as at
                          ON at.CODPESSOA = p.CODPESSOA
                          and aval.ANO = at.ANO
                          and aval.MES = at.MES
                          left join faltasfolhamanual as ffm
                          on ffm.codpessoa = p.CODPESSOA
                          AND ffm.Ano = aval.ANO
                          AND ffm.Mes = aval.MES
                          where CODSITUACAO <> 'D' and p.CODPESSOA = 2981
                          group by p.CODPESSOA, aval.ANO, aval.MES, p.CODPESSOA;
                          
                          select * from participantes where CODAVALIACAO = 48;
                          
                          select * from assiduidade where chapa = "011942";
                          SELECT * FROM faltasfolhamanual where chapa = "11942";
                          
                          select * from participantes;
                          
                          DELETE a FROM participantes AS a, participantes AS b WHERE a.CODPARTICIPANTE=b.CODPARTICIPANTE 
                          AND a.CODAVALIACAO = b.CODAVALIACAO AND a.ID < b.ID