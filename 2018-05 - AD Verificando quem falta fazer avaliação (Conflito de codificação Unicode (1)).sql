select CHAPAAVALIADOR, f.NOME, p.CODAVALIACAO, a.NOME, p.CHAPAAVALIADO, func.NOME, p.CODPARTICIPANTE, func.DATAADMISSAO, func.DATADEMISSAO from participantes as p
left join notas as n 
    on n.CODCOLIGADA = p.CODCOLIGADA 
    and n.CODAVALIACAO = p.CODAVALIACAO
    and n.CODPARTICIPANTE = p.CODPARTICIPANTE
inner join funcionarios as f
    on f.CHAPA = p.CHAPAAVALIADOR
inner join avaliacoes as a
    on a.CODCOLIGADA = p.CODCOLIGADA
    and a.CODAVALIACAO = p.CODAVALIACAO
inner join funcionarios as func 
    on func.CHAPA = p.CHAPAAVALIADO
left join licenciados as l 
    on l.CODPARTICIPANTE = p.CODPARTICIPANTE
where NOTAAVALIADOR is null and a.CODAVALIACAO >24 and a.CODAVALIACAO < 37 and f.CHAPA not in (99996,99999 )
      and l.CHAPAVALIADO is null
order by f.NOME, p.CODAVALIACAO
; 







select l.CODAVALIACAO, l.NOME, l.CHAPAVALIADO, l.DTINICIAL, l.DTFINAL, LICENCA, p.CHAPAAVALIADO, p.CODAVALIACAO
from licenciados as l
inner join participantes as p
    on p.CHAPAAVALIADO = l.CHAPAVALIADO and p.CODAVALIACAO = l.CODAVALIACAO
order by l.CODAVALIACAO;


delete from p 
using participantes p 
left join licenciados l
 on p.CHAPAAVALIADO = l.CHAPAVALIADO and p.CODAVALIACAO = l.CODAVALIACAO
where l.CHAPAVALIADO is not null
order by l.CODAVALIACAO;
    

select * from licencas where CHAPA = "030327";

//Participntes pra apagar:
DELETE FROM participantes where CODPARTICIPANTE in (
59728,
59761,
60286,
60862,
61381,
62433, 
61927,  
63461, 
62967, 
64485,
65503, 
65012,
66026,
66507,
67023,
67497,
68483,
72028,
72027,
72026,
60152,
60149,
61245,
61248,
62301,
62298,
63328,
63331,
64352,
64355,
65375,
67372,
72405,
64916,
63890,
62869,
61826,
60758);

select CHAPAAVALIADOR, f.NOME, p.CODAVALIACAO, a.NOME, p.CHAPAAVALIADO, func.NOME, p.CODPARTICIPANTE, func.DATAADMISSAO, func.DATADEMISSAO from participantes as p
left join notas as n 
    on n.CODCOLIGADA = p.CODCOLIGADA 
    and n.CODAVALIACAO = p.CODAVALIACAO
    and n.CODPARTICIPANTE = p.CODPARTICIPANTE
inner join funcionarios as f
    on f.CHAPA = p.CHAPAAVALIADOR
inner join avaliacoes as a
    on a.CODCOLIGADA = p.CODCOLIGADA
    and a.CODAVALIACAO = p.CODAVALIACAO
inner join funcionarios as func 
    on func.CHAPA = p.CHAPAAVALIADO
left join licenciados as l 
    on l.CODPARTICIPANTE = p.CODPARTICIPANTE
where NOTAAVALIADOR is null and a.CODAVALIACAO >36 and a.CODAVALIACAO < 49 and f.CHAPA not in (99996,99999 )
      and l.CHAPAVALIADO is null and (func.DATAADMISSAO) >  (a.DATAABERTURA)
order by f.NOME, p.CODAVALIACAO
; 

delete from participantes where CODPARTICIPANTE in (
66382,
72407,
72406,
62762,
63650,
62763,
64677,
72152, 
59653,
60015,
60018,
60014,
60017,
60013,
60016);


delete from participantes where CODPARTICIPANTE in (
71828, 
62213, 
62212, 
63245, 
63244, 
64269, 
64268, 
65289, 
65288, 
66297, 
66296, 
60347, 
60346, 
60491, 
61440, 
61439, 
61575, 
62492, 
62491, 
63517, 
63516, 
64542, 
64541, 
65561, 
65560, 
66564, 
66563, 
67553, 
72594, 
72597, 
72596, 
72595, 
59946, 
60002, 
60005, 
59945, 
60001, 
60004, 
60007, 
59947, 
60003, 
60006, 
61098, 
61101, 
61097, 
61100, 
61103, 
61099, 
61102, 
62156, 
62159, 
62155, 
62158, 
62154, 
62157, 
62160, 
63193, 
63189, 
63192, 
63188, 
63191, 
63194, 
63190, 
64212, 
64215, 
64211, 
64214, 
64217, 
64213, 
64216, 
65234, 
65237, 
65233, 
65236, 
65232, 
65235, 
65238, 
66246, 
66245, 
66244, 
66247, 
66243, 
67236, 
67235, 
67238, 
67234, 
67237, 
72264, 
72263, 
72266, 
72265, 
72182, 
59525, 
61574, 
61577, 
61573, 
61576, 
61581, 
62623, 
62629, 
62624, 
63640, 
63643, 
63649, 
63641, 
63644, 
64671, 
64670, 
64676, 
65685, 
65691, 
65686, 
66687, 
66692, 
66686, 
67680, 
68663, 
72726, 
72729, 
72536, 
72732, 
72725, 
72728, 
73776, 
59800, 
59889, 
59802, 
60988, 
62047, 
63082, 
64103, 
65125, 
59560, 
60666, 
61735, 
62778, 
64825, 
65839, 
66837, 
72879, 
60496, 
60240, 
61585, 
61570, 
61580, 
61584, 
61569, 
61579, 
61583, 
61335, 
61586, 
61568, 
61572, 
61578, 
62627, 
62630, 
62617, 
62633, 
62626, 
62616, 
62632, 
62622, 
62625, 
62388, 
62628, 
62615, 
62631, 
62618, 
63647, 
63651, 
63646, 
63653, 
63639, 
63642, 
63645, 
63648, 
63416, 
63652, 
63637, 
64679, 
64674, 
64678, 
64673, 
64440, 
64680, 
64669, 
64672, 
64675, 
65688, 
65694, 
65687, 
65690, 
65693, 
65689, 
65692, 
65695, 
65458, 
66690, 
66693, 
66696, 
66695, 
66464, 
66691, 
66694, 
67454, 
67683, 
67678, 
67682, 
67681, 
67684, 
72727, 
72730, 
72733, 
72491, 
72731, 
73777, 
60215, 
61310, 
62363);


delete from participantes where CODPARTICIPANTE in (
60647, 
61719, 
62620, 
62621, 
61593, 
62641, 
62640, 
60510, 
61594, 
62619);



select CODEQUIPE from funcionarios where CHAPA = '012158'

select E.NOME AS NOME,
							  E.CHAPA AS CHAPA, 
							  E.DATAADMISSAO AS DATAADMISSAO,
							  C.NOME AS CARGO, 
							  I.IMAGEM AS IMAGEM//, 
							 // Q.DESCRICAO AS LIDER
							  from funcionarios as E
		                      left join funcoes AS C on C.CODIGO = E.CODFUNCAO
							  left join pessoas AS P on P.CODIGO = E.CODPESSOA
							  left join fotos AS I on P.IDIMAGEM = I.IDIMAGEM
							 // inner join equipes as Q ON Q.CODCLIENTE = E.CODEQUIPE
							  where E.CHAPA = '012158';


select p.CHAPAAVALIADO                  as CHAPA,  
       func.NOME                        AS NOME, 
       func.CODFILIAL                   as FILIAL, 
       func.CODSECAO                    as SECAO,
       SE.DESCRICAO                     as DESCRICAO,
       func.DATAADMISSAO                AS ADMISSAO, 
       func.DATADEMISSAO                 AS DEMISSAO,  
       CHAPAAVALIADOR                   AS CHAPAAVALIADOR, 
       f.NOME                           AS NOMEAVALIADOR,  
       group_concat(a.NOME)                as AVALIACAO
  from participantes as p
left join notas as n 
    on n.CODCOLIGADA = p.CODCOLIGADA 
    and n.CODAVALIACAO = p.CODAVALIACAO
    and n.CODPARTICIPANTE = p.CODPARTICIPANTE
inner join funcionarios as f
    on f.CHAPA = p.CHAPAAVALIADOR
inner join avaliacoes as a
    on a.CODCOLIGADA = p.CODCOLIGADA
    and a.CODAVALIACAO = p.CODAVALIACAO
inner join funcionarios as func 
    on func.CODPESSOA = p.CODPESSOA
left join licenciados as l 
    on l.CODPARTICIPANTE = p.CODPARTICIPANTE
LEFT JOIN secoes as SE ON SE.CODIGO = CONCAT(func.CODFILIAL,'.',func.CODSECAO)
where NOTAAVALIADOR is null and a.CODAVALIACAO >36 and a.CODAVALIACAO < 49 and f.CHAPA not in (99996,99999 )
      and l.CHAPAVALIADO is null 
GROUP BY p.CODPESSOA
order by f.nome, func.NOME, a.CODAVALIACAO
; 

SELECT * FROM secoes where CODIGO = '11.011.03.02.01'
select * from licenciados where CHAPAVALIADO = '012151';
select * from licencas where CHAPA = '012151';

delete from licenciadosnovos;

insert into licenciados(CODAVALIACAO, NOME, CODPARTICIPANTE, CHAPAVALIADO, DTINICIAL, DTFINAL, DTABERTURA, LICENCA, DTVALIDADE)
select licenciadosnovos.CODAVALIACAO, licenciadosnovos.NOME, licenciadosnovos.CODPARTICIPANTE, licenciadosnovos.CHAPAVALIADO, 
licenciadosnovos.DTINICIAL, licenciadosnovos.DTFINAL, licenciadosnovos.DTABERTURA, licenciadosnovos.LICENCA, "0000-00-00" as DTVALIDADE from licenciadosnovos
left join licenciados on licenciados.CODPARTICIPANTE = licenciadosnovos.CODPARTICIPANTE
where licenciados.CHAPAVALIADO is null
;

DELETE FROM participantes WHERE CHAPAAVALIADO = '110566' AND CODAVALIACAO = 25;

DROP TABLE duplifeitas;
create temporary table duplifeitas
select p.CODPESSOA AS CODPESSOA, CHAPAAVALIADO, p.CODAVALIACAO AS CODAVALIACAO, CHAPAAVALIADOR, n.CODITEMAVAL, COUNT(1) AS CONTADOR from participantes as p 
inner join notas as n on n.CODCOLIGADA = p.CODCOLIGADA and p.CODAVALIACAO = n.CODAVALIACAO and p.CODPARTICIPANTE = n.CODPARTICIPANTE
WHERE p.CODAVALIACAO > 24
GROUP BY CODPESSOA, p.CODAVALIACAO, n.CODITEMAVAL
HAVING CONTADOR > 1


create temporary table duplidupli
select * from duplifeitas
group by CODPESSOA, CODAVALIACAO

select p.CODAVALIACAO, a.NOME, p.CODPARTICIPANTE, p.CHAPAAVALIADO, f.NOME AS AVALIADO, p.CHAPAAVALIADOR, l.NOME as AVALIADOR from participantes as p
inner join duplidupli as d
on p.CODPESSOA = d.CODPESSOA and p.CODAVALIACAO = d.CODAVALIACAO 
inner join avaliacoes as a on a.CODCOLIGADA = p.CODCOLIGADA and a.CODAVALIACAO = p.CODAVALIACAO
inner join funcionarios as f on f.CHAPA = p.CHAPAAVALIADO
inner join funcionarios as l on l.CHAPA = p.CHAPAAVALIADOR;

select * from participantes where CHAPAAVALIADO = '';


SELECT * FROM participantes WHERE CHAPAAVALIADO IN (012345);

DELETE FROM participantes where CODPARTICIPANTE in (60246,
60243,
63419,
60515,
61599,
62646,
63154,
65239,
66248,
61587,
62634,
72031,
60381,
61472,
62521,
61473,
62522,
63546,
64572,
65591,
66593,
67582,
59763,
60864,
61929,
59714,
60818,
60504,
61588,
62635,
60506,
61590,
62637,
59757,
60858,
59762,
60863,
61928,
60507,
61589,
62636,
60065,
61161,
59545,
60651,
61720,
59540,
60063,
61159,
61170,
60064,
60611,
59921,
61019,
63799,
59546,
60652,
61721,59758,60859);

select * from licencas where CHAPA = '110364';

select * from funcionarios where CHAPA = '110437';

update funcionarios set CODFUNCAO = 'F044' where CODFUNCAO = '11'

select * from funcoes;

select * from participantes where CHAPAAVALIADO = '110364'


select f.CHAPA as CHAPA, 
			f.NOME as NOME, 
			FUNCAO, 
			f.DATAADMISSAO AS DATAADMISSAO, 
			ROUND(SUM(MEDIA)/COUNT(f.CHAPA),2) as MEDIA, 
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
			AVALIADOR AS AVALIADOR
			FROM media2016 
			inner join funcionarios as f on f.CHAPA = media2016.chapa
			LEFT JOIN secoes as s on s.CODIGO = CONCAT(f.CODFILIAL, ".", f.CODSECAO)
			WHERE AVALIACAO between 25 and 36 group by f.CHAPA order by MEDIA desc


create temporary table feitas
select p.CHAPAAVALIADO AS CHAPAAVALIADO,
       p.CODPESSOA as CODPESSOA, 
       f.NOME AS NOME, 
       p.CODAVALIACAO AS CODAVALIACAO,
      (if(n.CODITEMAVAL is not null, 1,0)) as EXISTE 
from participantes as p
inner join funcionarios as f on f.CODPESSOA = p.CODPESSOA
left join notas as n on n.CODPARTICIPANTE = p.CODPARTICIPANTE and n.CODCOLIGADA = p.CODCOLIGADA and n.CODAVALIACAO = p.CODAVALIACAO 
where f.CODEQUIPE = 16 and p.CODAVALIACAO between 25 and 36
group by p.CODPESSOA, p.CODAVALIACAO;

select f.CHAPA as CHAPA, 
			f.NOME as NOME, 
			FUNCAO, 
			f.DATAADMISSAO AS DATAADMISSAO, 
			ROUND(SUM(MEDIA)/COUNT(f.CHAPA),2) as MEDIA, 
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
			COUNT(feitas.CHAPAAVALIADO) AS TOTAL, 
			SUM(feitas.existe) AS FEITAS
			FROM media2016 
			inner join funcionarios as f on f.CHAPA = media2016.chapa
			LEFT JOIN secoes as s on s.CODIGO = CONCAT(f.CODFILIAL, ".", f.CODSECAO)
			INNER JOIN feitas on feitas.CODPESSOA = media2016.CODPESSOA AND feitas.CODAVALIACAO = media2016.AVALIACAO
			WHERE AVALIACAO between 25 and 36 group by feitas.CODPESSOA order by MEDIA desc

SELECT * FROM media2016;


select p.CHAPAAVALIADO AS CHAPAAVALIADO,
       p.CODPESSOA as CODPESSOA, 
       f.NOME AS NOME, 
       COUNT(p.CODAVALIACAO) AS CODAVALIACAO,
      (if(n.CODITEMAVAL is not null, 1,0)) as EXISTE 
from participantes as p
inner join funcionarios as f on f.CODPESSOA = p.CODPESSOA
left join notas as n on n.CODPARTICIPANTE = p.CODPARTICIPANTE and n.CODCOLIGADA = p.CODCOLIGADA and n.CODAVALIACAO = p.CODAVALIACAO 
where f.CODEQUIPE = 16 and p.CODAVALIACAO between 25 and 36
group by p.CODPESSOA, p.CODAVALIACAO;

CREATE TEMPORARY TABLE totais
select count(CODAVALIACAO) AS QTDE, SUM(EXISTE) AS FEITAS, CHAPAAVALIADO,
       CODPESSOA, NOME from feitas GROUP BY CODPESSOA;

select f.CHAPA as CHAPA, 
			f.NOME as NOME, 
			FUNCAO, 
			f.DATAADMISSAO AS DATAADMISSAO, 
			ROUND(SUM(MEDIA)/COUNT(f.CHAPA),2) as MEDIA, 
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
			(totais.CHAPAAVALIADO) AS TOTAL, 
			(totais.FEITAS) AS FEITAS
			FROM media2016 
			inner join funcionarios as f on f.CHAPA = media2016.chapa
			LEFT JOIN secoes as s on s.CODIGO = CONCAT(f.CODFILIAL, ".", f.CODSECAO)
			LEFT JOIN totais on totais.CODPESSOA = media2016.CODPESSOA 
			WHERE AVALIACAO between 25 and 36 group by media2016.CODPESSOA order by MEDIA desc;


delete from participantes where CHAPAAVALIADOR in (99996,99999);

select * from funcionarios where CHAPA = '100197';

select * from funcoes
left join vercargos
on vercargos.codcargo = funcoes.CODIGO
where vercargos.codcargo is null and funcoes.CODIGO like '%F%'


select * from vercargos;

select * from licenciados
where CODIGO is not null