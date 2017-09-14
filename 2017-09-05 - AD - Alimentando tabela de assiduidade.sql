INSERT INTO assiduidade (codpessoa, chapa, atraso, ano, mes) 
select CODPESSOA as codpessoa, atrasos.CHAPA AS chapa, ROUND(sum(atraso)/60,2) AS atraso, YEAR(data) AS ano, MONTH(data) AS mes
from atrasos 
INNER JOIN funcionarios as f on f.CHAPA = atrasos.chapa
group by CODPESSOA, YEAR(data), MONTH(data)
having ANO = 2016;


select * from assiduidade
inner join avaliacoes on year(avaliacoes.DATAABERTURA) = ano and month(avaliacoes.DATAABERTURA)=mes;

update assiduidade 
inner join avaliacoes on year(avaliacoes.DATAABERTURA) = ano and month(avaliacoes.DATAABERTURA)=mes
set assiduidade.codavaliacao = avaliacoes.CODAVALIACAO

drop table if exists acertohoras;
create temporary table acertohoras
select 
sum(
            if(
            atrasos.atraso>120,atrasos.falta+atrasos.atraso,atrasos.falta
            )
        )/60 as atraso, chapa, MONTH(data) as mes, YEAR(data) as ano

 from atrasos
group by chapa, YEAR(data), MONTH(data)
ORDER BY YEAR(data), MONTH(data) ;



update assiduidade
inner join acertohoras as AC on AC.chapa = assiduidade.chapa and AC.mes = assiduidade.mes and AC.ano = assiduidade.ano 
set assiduidade.atraso = AC.atraso

