//1 - Criando estrutura da AD com cada nota
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
					P.CHAPAAVALIADOR  AS AVALIADOR
					from notas AS N
					inner join participantes AS P on N.CODAVALIACAO = P.CODAVALIACAO and N.CODPARTICIPANTE = P.CODPARTICIPANTE
					inner JOIN competencias AS S ON N.CODITEMAVAL = S.CODCOMPETENCIA
					inner JOIN avaliacoes AS  V ON V.CODAVALIACAO = N.CODAVALIACAO
					inner JOIN veravaliacoes AS VAV on V.CODAVALIACAO = VAV.codigoavaliacao
					where statuslider = 0 and P.CHAPAAVALIADO;
GO

//2 - Montando a avaliação por mês


drop table if exists notasPessoa;    
                CREATE TEMPORARY TABLE notasPessoa    
                select
						AVALIACAO, 
						CHAPA,
						CODPARTICIPANTE,
						DESCRICAO,
						PARTICIPANTE,
						AVALIADOR,
						MAX(IF(ITEM = "01", NOTA, 0)) AS NOTA1, 
						MAX(IF(ITEM = "02", NOTA, 0)) AS NOTA2,
						MAX(IF(ITEM = "04", NOTA, 0)) AS NOTA4,
						MAX(IF(ITEM = "05", NOTA, 0)) AS NOTA5,  
						MAX(IF(ITEM = "06", NOTA, 0)) AS NOTA6, 
						MAX(IF(ITEM = "07", NOTA, 0)) AS NOTA7,  
						MAX(IF(ITEM = "08", NOTA, 0)) AS NOTA8,
						MAX(IF(ITEM = "09", NOTA, 0)) AS NOTA9,  
						MAX(IF(ITEM = "10", NOTA, 0)) AS NOTA10,
						MAX(IF(ITEM = "12", NOTA, 0)) AS NOTA12,
						MAX(IF(ITEM = "13", NOTA, 0)) AS NOTA13,
						MAX(IF(ITEM = "14", NOTA, 0)) AS NOTA14,  
						MAX(IF(ITEM = "15", NOTA, 0)) AS NOTA15
 						from notas_temp
                        where NOTA != 0
						GROUP BY AVALIACAO, CHAPA
						ORDER BY AVALIACAO
GO


select * from notasPessoa where CHAPA = '110359';

select NOME from funcionarios where CHAPA = '019357';

select SUM() from notasPessoa order by CHAPA;

delete from media2016;
select * from media2016;

select DISTINCT CHAPA, SUM(MEDIA) as SOMA, COUNT(CHAPA) AS QTDE  FROM media2016 group by CHAPA

select * from media2016 where AVALIACAO between 25 and 36 and  CHAPA = '019357' group by CHAPA, AVALIACAO;

select * from notasPessoa WHERE CHAPA = '019357' order by CHAPA;

select DISTINCT CHAPA, SUM(MEDIA) as SOMA, COUNT(CHAPA) AS QTDE  FROM media2016 group by CHAPA;

select funcoes.NOME from funcionarios
inner join funcoes on
funcoes.CODIGO = funcionarios.CODFUNCAO
where CHAPA = '011942'

select * from funcionarios where CODPESSOA = 995;

select * from funcionarios where nome like '%suellen%'

select * from participantes 
left join notas on participantes.CODPARTICIPANTE = notas.CODPARTICIPANTE
where CHAPAAVALIADO = 12158
