select * from inst where paymno = 956;


select * from renegh where xanameTo like '%130898678%';
select * from renegh where xanameTo like '%101039313%';



select * from itxa where contrno in (0501530350,0110128481,0110158969,0110158970);


select * from ithist 
where contrno = 0501530350 and storeno = 5 and status = 41; 

select * from inst
where contrno = 0501530350 and storeno = 5 


select 
mid(C.remarks, 13,21)       as ContratoNovo,  
C.custno    			  as Cliente,
CLI.name      		      as Nome_Cliente___________,
H.storeno                 as LojaContrato,
H.contrno                 as Contrato, 
count(H.contrno)          as Qt_Parc,
sum(P.instamt)            as Vlr_Parcelas,
sum(H.amt+P.instamt)	  as Juros__,
sum(H.amt)         		  as Vlr_com_Juros,
1000                      as QtCliente
from ithist as H
inner join sqldados.itxa as P on (H.contrno = P.contrno and H.storeno = P.storeno and H.instno = P.instno)
inner join sqldados.inst as C on (C.contrno = P.contrno and C.storeno = P.storeno)
inner join sqldados.custp as CLI on (C.custno =  CLI.no)
where H.date between 20180901 and 20180920
 and H.status = 6
 GROUP BY H.contrno, H.storeno
 having (ContratoNovo <>  '')
 order by ContratoNovo;
 
 
 select * from ithist where contrno = 110313372 and storeno = 11;
  select mid(remarks, 13,21) as obs from inst where contrno = 110158970 and storeno = 11;
 
 select * from renegh where xanameTo like '%0130792934%';
 
 select * from inst where custno = 666663 and paymno = 956;
 
 
 select
mid(C.remarks, 13,21)       as ContratoNovo,
C.custno    			          as Cliente,
MID(CLI.name,1,20)          as Nome_Cliente___________,
H.storeno                   as Loja,
H.contrno                   as Contrato,
count(H.contrno)            as Qt_Parc,
sum(P.instamt)             as Vlr_Parcelas,
sum(H.amt)	               as Juros__,
sum(H.amt+P.instamt)       as Vlr_com_Juros
from sqldados.ithist as H
inner join sqldados.itxa as P on (H.contrno = P.contrno and H.storeno = P.storeno and H.instno = P.instno)
inner join sqldados.inst as C on (C.contrno = P.contrno and C.storeno = P.storeno)
inner join sqldados.custp as CLI on (C.custno =  CLI.no)
where H.date between 20180901 and 20180920
 and H.status = 6
 and mid(C.remarks, 18,18) <> 0 
// and (C.storeno = [$LJ] or [$LJ] = 0)
 //and H.status = 6
GROUP BY H.contrno, H.storeno
having (ContratoNovo <>  '' or ContratoNovo <>  0)
order by ContratoNovo;
