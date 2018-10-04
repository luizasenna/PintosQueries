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
          where statuslider = 0 and V.DATAABERTURA BETWEEN "2018-01-01"  and "2018-09-01"
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
                  						sum(IF(NOTAAVALIADOR <> 0 ,NOTAAVALIADOR,0)) AS NOTA,
                                        count(IF(NOTAAVALIADOR <> 0,NOTAAVALIADOR,0)) AS QTDE, 
                                        (sum(IF(NOTAAVALIADOR <> 0 ,NOTAAVALIADOR,0))/count(IF(NOTAAVALIADOR <> 0,NOTAAVALIADOR,0))) AS MEDIA
                   						from notas_temp_todas as todasAsNotas
                  						left join assiduidade AS AE
                                        on AE.codpessoa = todasAsNotas.CODPESSOA
                                        AND AE.codavaliacao = todasAsNotas.AVALIACAO
                                        left join vercargos as VC
                                        on VC.codcargo = todasAsNotas.CODFUNCAO
                                       
                  						GROUP BY AVALIACAO, CODPESSOA
                  						HAVING (NOTA/QTDE) <=7
                  						ORDER BY AVALIACAO
          
          select if() from notasPessoaTodas order by CODPESSOA;
          
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
                  						ORDER BY AVALIACAO;
                  						
                  						select * from notasPessoaTodas group by CODPARTICIPANTE order by CODPESSOA;
                  						
                  						
                  		select 
                        notasbaixas.CODPESSOA,
                        f.NOME as NOME,
                        FUNCAO,
                        f.DATAADMISSAO AS DATAADMISSAO,
                        MEDIA as MEDIA,
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
                        AVALIADOR
                        FROM notasbaixas
                        left join funcionarios as f on f.CODPESSOA = notasbaixas.CODPESSOA
                        inner join avaliacoes as av
                        on av.CODAVALIACAO = AVALIACAO
                        LEFT JOIN secoes as s on s.CODIGO = f.CODSECAO
                        WHERE av.DATAABERTURA BETWEEN "2018-01-01"  and "2018-09-01"
                        AND MEDIA < 8
                        AND f.CODSITUACAO <> "D"
                        group by notasbaixas.CODPESSOA order by AVALIADOR, MEDIA desc