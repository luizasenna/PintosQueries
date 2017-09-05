INSERT INTO assiduidade (codpessoa, chapa, atraso, ano, mes) 
select CODPESSOA as codpessoa, atrasos.CHAPA AS chapa, ROUND(sum(atraso)/60,2) AS atraso, YEAR(data) AS ano, MONTH(data) AS mes
from atrasos 
INNER JOIN funcionarios as f on f.CHAPA = atrasos.chapa
group by CODPESSOA, YEAR(data), MONTH(data)
having ANO = 2016;
