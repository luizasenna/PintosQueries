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
    on func.CHAPA = p.CHAPAAVALIADO
left join licenciados as l 
    on l.CODPARTICIPANTE = p.CODPARTICIPANTE
LEFT JOIN secoes as SE ON SE.CODIGO = CONCAT(func.CODFILIAL,'.',func.CODSECAO)
where NOTAAVALIADOR is null and a.CODAVALIACAO >24 and a.CODAVALIACAO < 37 and f.CHAPA not in (99996,99999 )
      and l.CHAPAVALIADO is null
GROUP BY p.CHAPAAVALIADO
order by CHAPAAVALIADOR, f.NOME, a.CODAVALIACAO
; 
