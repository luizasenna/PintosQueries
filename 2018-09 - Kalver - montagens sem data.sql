create temporary table kalver
(primary key (storeno, pdvno, xano))
select storenoNfr as storeno, pdvnoNfr as pdvno, xanoNfr as xano, awnfrh.auxShort1 as routeno,
  ifnull(route.name,"Rota") as rota
from sqldados.awnfrh
  inner join sqldados.route
    on awnfrh.auxShort1 = route.no
group by storenoNfr, pdvnoNfr, xanoNfr

create temporary table kalver2
SELECT 
       M.osno                                      AS OS,
       DATE_FORMAT(if(N.dataEntrega = 0, N.dataVenda, N.dataEntrega), '%d/%m/%Y')
                                                   AS Dt_Entrega, 
       DATE_FORMAT(if(N.dataMontagem = 0, 0, N.dataMontagem), '%d/%m/%Y')      
                                                   AS Dt_Montagem,                                            
       CASE
          WHEN M.situacao = 0 THEN "Aberto"
          WHEN M.situacao = 1 THEN "Entregue"
          WHEN M.situacao = 2 THEN "Montado"
          WHEN M.situacao = 3 THEN "Devolvido"
          WHEN M.situacao = 4 THEN "Pendente"
          WHEN M.situacao = 5 THEN "Cancelado"
          WHEN M.situacao = 6 THEN "Fech.Aut"
          ELSE "OUTRO"
       END                                         AS Situacao,
       ifnull(MID(E.name,1,50), '')                AS Montador,
       N.custno                     AS Cod_Cliente,
       ifnull(MID(CLIENTE.name,1,20),'nulo')       AS Cliente, 
       P.prdno*1                                   AS Cod_Prod,
       MID(I.name,1,20)                            AS Descricao,
       P.grade                                     As Grade,
       IF (N.bits&4 = 0, 'Nao', 'Sim')             AS Bloqueado
FROM sqldados.nfmprdm as M
  left join sqldados.nfmprd as P
    on P.auxLong1 = M.osno
   left join sqldados.nfmprdtp as T
    on T.no = P.auxShort1
  left join sqldados.emp as E
    on E.no = M.empno
  left join sqldados.nfm as N
    on  N.storeno = P.storeno
    and N.pdvno   = P.pdvno
    and N.xano    = P.xano
  left join sqldados.custp as CLIENTE
    on CLIENTE.no = N.custno
  left join kalver as R
    on  R.storeno = P.storeno
    and R.pdvno   = P.pdvno
    and R.xano    = P.xano
  left join sqldados.prd as I
    on I.no = P.prdno
  left join sqldados.vend as F
    on F.no = I.mfno
  left join sqldados.cl as C
    on I.clno = C.no
     left join nfr as ROM
    ON ROM.xano = N.xano
    and ROM.storeno = N.storeno
    and ROM.pdvno = N.pdvno
where (N.dataEntrega BETWEEN 20180915 AND 20180915) and N.dataMontagem = 0
   // and CLIENTE.name like '%MARIA LENITA MONTEIRO DOS SANTOS%'
    and situacao in (1) 
    order by osno
   // AND (M.situacao like '%[$SIT]%' OR '[$SIT]'='*')
   // AND (if ([$BLOQ] = 0, N.bits&4 = 0, N.bits&4 <> 0))
    AND (M.empno = 1452)  


select * from nfmprdm where empno = 1452 and dataMontagemI between 20180901 and 20180905;

select ROM.auxShort5,   ROM.xatype, N.dataMontagem, N.xano, N.pdvno, N.storeno, N.dataEntrega, N.custno, CLIENTE.name from nfmprd as P 
 left join sqldados.nfmprdtp as T
    on T.no = P.auxShort1
  left join sqldados.nfm as N
    on  N.storeno = P.storeno
    and N.pdvno   = P.pdvno
    and N.xano    = P.xano
  left join sqldados.custp as CLIENTE
    on CLIENTE.no = N.custno
  left join kalver as R
    on  R.storeno = P.storeno
    and R.pdvno   = P.pdvno
    and R.xano    = P.xano
     left join sqldados.prd as I
    on I.no = P.prdno
  left join sqldados.vend as F
    on F.no = I.mfno
      left join sqldados.cl as C
    on I.clno = C.no
    left join nfr as ROM
    ON ROM.xano = N.xano
    and ROM.storeno = N.storeno
    and ROM.pdvno = N.pdvno
    left join  sqldaos.nfmprd as M
    on P.auxLong1 = M.osno
where (N.dataEntrega BETWEEN 20180101 AND 20180910) and N.dataMontagem = 0 and ROM.custno = 119820 //ROM.auxShort5 <> 8 //AND (B.empno = 1452)  


select osno, situacao from sqldados.nfmprdm as M where osno in (685192,
685360,
685538,
685760,
685799,
685800,
685764,
685765,
685766)


SELECT
       M.osno                                      AS OS,
       DATE_FORMAT(if(N.dataEntrega = 0, N.dataVenda, N.dataEntrega), '%d/%m/%Y')
                                                   AS Dt_Entrega,
       DATE_FORMAT(if(N.dataMontagem = 0, 0, N.dataMontagem), '%d/%m/%Y')
                                                   AS Dt_Montagem,
       CASE
          WHEN M.situacao = 0 THEN "Aberto"
          WHEN M.situacao = 1 THEN "Entregue"
          WHEN M.situacao = 2 THEN "Montado"
          WHEN M.situacao = 3 THEN "Devolvido"
          WHEN M.situacao = 4 THEN "Pendente"
          WHEN M.situacao = 5 THEN "Cancelado"
          WHEN M.situacao = 6 THEN "Fech.Aut"
          ELSE "OUTRO"
       END                                         AS Situacao,
       ifnull(MID(E.name,1,20), '')                AS Montador,
       ifnull(N.custno,'nulo')                     AS Cod_Cliente,
       ifnull(MID(CLIENTE.name,1,20),'nulo')       AS Cliente,
       P.prdno*1                                   AS Cod_Prod,
       MID(I.name,1,20)                            AS Descricao,
       P.grade                                     As Grade,
       IF (N.bits&4 = 0, 'Nao', 'Sim')             AS Bloqueado
FROM sqldados.nfmprd              AS P
  INNER JOIN sqldados.nfmprdm     AS M
    ON  P.auxLong1 = M.osno
   left join sqldados.nfmprdtp as T
    on T.no = P.auxShort1
  left join sqldados.emp as E
    on E.no = M.empno
  left join sqldados.nfm as N
    on  N.storeno = P.storeno
    and N.pdvno   = P.pdvno
    and N.xano    = P.xano
  left join sqldados.custp as CLIENTE
    on CLIENTE.no = N.custno
  left join kalver as R
    on  R.storeno = P.storeno
    and R.pdvno   = P.pdvno
    and R.xano    = P.xano
  left join sqldados.prd as I
    on I.no = P.prdno
  left join sqldados.vend as F
    on F.no = I.mfno
  left join sqldados.cl as C
    on I.clno = C.no
where (M.dataMontagemF BETWEEN 20180501 AND 20180910)
    AND (M.situacao = 0)
  
    AND (M.empno = 1452)
    
    
    
    
SELECT
       M.osno                                      AS OS,
       DATE_FORMAT(if(M.dataMontagemF = 0, 0, M.dataMontagemF), '%d/%m/%Y')
                                                   AS Dt_Montagem,
       CASE
          WHEN M.situacao = 0 THEN "Aberto"
          WHEN M.situacao = 1 THEN "Entregue"
          WHEN M.situacao = 2 THEN "Montado"
          WHEN M.situacao = 3 THEN "Devolvido"
          WHEN M.situacao = 4 THEN "Pendente"
          WHEN M.situacao = 5 THEN "Cancelado"
          WHEN M.situacao = 6 THEN "Fech.Aut"
          ELSE "OUTRO"
       END                                         AS Situacao,
       ifnull(MID(E.name,1,20), '')                AS Montador,
       ifnull(N.custno,'nulo')                     AS Cod_Cliente,
       ifnull(MID(CLIENTE.name,1,20),'nulo')       AS Cliente,
       P.prdno*1                                   AS Cod_Prod,
       MID(I.name,1,20)                            AS Descricao,
       P.grade                                     As Grade,
       IF (N.bits&4 = 0, 'Nao', 'Sim')             AS Bloqueado
FROM sqldados.nfmprd              AS P
  INNER JOIN sqldados.nfmprdm     AS M
    ON  P.auxLong1 = M.osno
  INNER JOIN sqldados.emp         AS E
    ON  E.no = M.empno
  INNER JOIN sqldados.prd         AS I
    ON  I.no = P.prdno
  INNER JOIN sqldados.ptmontagem  AS PT
    ON  PT.id        = I.free_fld4
    AND PT.tpservico = P.auxShort1
  INNER JOIN sqldados.nfmprdtp    AS Tp
    ON  Tp.no = P.auxShort1
  left join sqldados.nfm as N
    on  N.storeno = P.storeno
    and N.pdvno   = P.pdvno
    and N.xano    = P.xano
      left join sqldados.custp as CLIENTE
    on CLIENTE.no = N.custno
WHERE //M.situacao = 1
  //AND 
  IF(M.situacao = 2, M.dataMontagemF BETWEEN 20180917 AND 20180917, 
  N.dataMontagem BETWEEN 20180917 AND 20180917 )
  and  (M.empno = 460)
  AND (M.empno   = [$VD] OR [$VD] = 0)
  AND (P.storeno = [$LJ] OR [$LJ] = 0)
  AND (groupno   = [$CL] OR [$CL] = 0)
  AND (setorno   = [$CL] OR [$CL] = 0)
  AND (I.clno    = [$CL] OR [$CL] = 0)
ORDER BY E.id, P.storeno, P.pdvno, P.xano;



SELECT
       M.osno                                      AS OS,
       DATE_FORMAT(if(N.dataEntrega = 0, N.dataVenda, N.dataEntrega), '%d/%m/%Y')
                                                   AS Dt_Entrega,
       DATE_FORMAT(if(N.dataMontagem = 0, 0, N.dataMontagem), '%d/%m/%Y')
                                                   AS Dt_Montagem,
       CASE
          WHEN M.situacao = 0 THEN "Aberto"
          WHEN M.situacao = 1 THEN "Entregue"
          WHEN M.situacao = 2 THEN "Montado"
          WHEN M.situacao = 3 THEN "Devolvido"
          WHEN M.situacao = 4 THEN "Pendente"
          WHEN M.situacao = 5 THEN "Cancelado"
          WHEN M.situacao = 6 THEN "Fech.Aut"
          ELSE "OUTRO"
       END                                         AS Situacao,
       ifnull(MID(E.name,1,20), '')                AS Montador,
       ifnull(N.custno,'nulo')                     AS Cod_Cliente,
       ifnull(MID(CLIENTE.name,1,20),'nulo')       AS Cliente,
       P.prdno*1                                   AS Cod_Prod,
       MID(I.name,1,20)                            AS Descricao,
       P.grade                                     As Grade,
       IF (N.bits&4 = 0, 'Nao', 'Sim')             AS Bloqueado
  FROM sqldados.nfmprd              AS P
  INNER JOIN sqldados.nfmprdm     AS M
    ON  P.auxLong1 = M.osno
   left join sqldados.nfmprdtp as T
    on T.no = P.auxShort1
  left join sqldados.emp as E
    on E.no = M.empno
  left join sqldados.nfm as N
    on  N.storeno = P.storeno
    and N.pdvno   = P.pdvno
    and N.xano    = P.xano
  left join sqldados.custp as CLIENTE
    on CLIENTE.no = N.custno
  left join kalver as R
    on  R.storeno = P.storeno
    and R.pdvno   = P.pdvno
    and R.xano    = P.xano
  left join sqldados.prd as I
    on I.no = P.prdno
  left join sqldados.vend as F
    on F.no = I.mfno
  left join sqldados.cl as C
    on I.clno = C.no
where (M.situacao like '%1%')
   // AND IF(M.situacao = '2', M.dataMontagemF BETWEEN 20180917 AND 20180917, 
  and N.dataMontagem BETWEEN 20180917 AND 20180917
  AND (M.empno = 460)
    AND (if ([$BLOQ] = 0, N.bits&4 = 0, N.bits&4 <> 0))
    AND (M.empno = [$MONT] OR [$MONT] = 0)
 
 select * from nfmprdm where osno = 688676;
 
 select * from nfm where xano = 95248993 and storeno = 5 and pdvno = 551 ;
 

 
 