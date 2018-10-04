select * from sqldados.awnfrh where auxShort5 = 7 order by date desc;

select * from nfr where auxShort5 = 7 order by date desc;

select * from awnfrh where remarks like '%casa fechada%' and date between 20171201 and 20171231 order by date desc;

create temporary table entregasp
select *
from awnfrh as h
where (h.remarks like '%casa fechada%' or h.remarks like 'tempo insuficiente%')
and h.date between 20171201 and 20171231 


create temporary table entregastodas
select date_format(h.date, "%d/%m/%Y")    as DataHistorico,  
       h.xanoNfr as Transacao,  
       h.cargano as Carga, 
       (entrega.auxShort4) as Motorista,
       m.name      as NomeMotorista,
       (entrega.auxShort5) as Ajudante1, 
       a1.name     as NomeAjudante1,  
       (entrega.auxShort6) as Ajudante2,
       a2.name     as NomeAjudante2,  
       x.prdno     as Codigo,  
       x.grade     as Grade,  
       p.name      as Produto, 
       h.remarks   as Motivo
from entregasp as h
inner join awnfrh as entrega on entrega.xanoNfr = h.xanoNfr and entrega.storenoNfr = h.storenoNfr and entrega.pdvnoNfr= h.pdvnoNfr and entrega.cargano = h.cargano  
left join emp as m on m.no = entrega.auxShort4 
left join emp as a1 on a1.no = entrega.auxShort5
left join emp as a2 on a2.no = entrega.auxShort6
inner join xalog2 as x on x.xano = h.xanoNfr and x.storeno = h.storenoNfr and x.pdvno = h.pdvnoNfr
inner join prd as p on p.no = x.prdno
where  entrega.status = 1
order by h.date desc;

create temporary table entregasver
select 
date_format(h.date, "%d/%m/%Y")    as DataHistorico,  
       h.xanoNfr as Transacao,  
       h.cargano as Carga, 
       (entrega.auxShort4) as Motorista,
      // m.name      as NomeMotorista,
       (entrega.auxShort5) as Ajudante1, 
    //   a1.name     as NomeAjudante1,  
       (entrega.auxShort6) as Ajudante2,
      // a2.name     as NomeAjudante2,
       h.remarks   as Motivo
from
awnfrh as entrega
inner join entregasp as h 
    on entrega.cargano = h.cargano 
    and entrega.xanoNfr = h.xanoNfr 
    and entrega.pdvnoNfr = h.pdvnoNfr
    and entrega.storenoNfr = h.storenoNfr

where  entrega.date between 20171201 and 20171231 and entrega.status = 1




select * from entregasp as h
left join entregastodas as e on e.Carga = h.cargano and e.Transacao = h.xanoNfr
where e.Carga is null