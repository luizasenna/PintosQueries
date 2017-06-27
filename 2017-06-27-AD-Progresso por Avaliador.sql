drop table temporary;
create temporary table temporary
select 
p.CHAPAAVALIADOR         as Chapa,
COUNT(p.CODPARTICIPANTE) as Quantidade, 
p.CODAVALIACAO           as Avaliacao 
from participantes as p
WHERE p.CODAVALIACAO > 24 and p.CHAPAAVALIADOR = '110494'
group by p.CHAPAAVALIADOR , p.CODAVALIACAO ;



select 
p.CHAPAAVALIADOR                  as Chapa,   
f.NOME                            as Avaliador,
p.CODAVALIACAO                    as Avaliacao, 
a.NOME                            as Nome,
Quantidade                        as Total, 
count(distinct n.CODPARTICIPANTE) as Feitos
from notas as n
inner join participantes as p
on p.CODCOLIGADA = n.CODCOLIGADA
and p.CODAVALIACAO = n.CODAVALIACAO
and p.CODPARTICIPANTE = n.CODPARTICIPANTE
inner join avaliacoes as a
on a.CODAVALIACAO = p.CODAVALIACAO
left join temporary as t
on t.Avaliacao = p.CODAVALIACAO
inner join funcionarios as f
on p.CHAPAAVALIADOR = f.CHAPA
where p.CHAPAAVALIADOR  = '110494'
group by p.CODAVALIACAO
