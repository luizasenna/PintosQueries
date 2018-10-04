select 
      PED.prdno       AS "Codigo",
      PRO.name        AS "Nome", 
      PED.qtty        AS "Quantidade",  
      EST.last_cost   as "Preco_Custo",
      date_format(EST.last_date, "%d/%m/%Y")   as "Dt_Ultima_Compra",
      PED.price       AS "Valor_Unitario", 
      PED.qtty*PED.price/1000  AS "Valor_Total" 
from sqldados.eoprd AS PED
inner join sqldados.prd AS PRO on PED.prdno = PRO.no 
inner join sqldados.stk as EST ON EST.prdno = PRO.no and EST.storeno = PED.storeno
where PED.ordno = 1154 and PED.storeno = 10;


select * from stk where prdno = 003627 and storeno = 10;