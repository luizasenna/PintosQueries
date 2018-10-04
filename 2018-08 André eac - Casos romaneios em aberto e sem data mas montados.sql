
 
 select * from nfm as N
 inner join nfmprd as P
    on  N.storeno = P.storeno
    and N.pdvno   = P.pdvno
    and N.xano    = P.xano
   INNER JOIN sqldados.nfmprdm     AS M
  select * from nfm as N
 inner join nfmprd as P
    on  N.storeno = P.storeno
    and N.pdvno   = P.pdvno
    and N.xano    = P.xano
   INNER JOIN sqldados.nfmprdm     AS M
    ON  P.auxLong1 = M.osno
 where N.status = 0 and M.situacao = 2 and N.dataMontagem = 0 and M.dataMontagemI <> 0
 and dataVenda >= 20180901
    ON  P.auxLong1 = M.osno
 where N.status = 0 and M.situacao = 2 and N.dataMontagem = 0 and M.dataMontagemI <> 0
 and dataVenda >= 20180901
 