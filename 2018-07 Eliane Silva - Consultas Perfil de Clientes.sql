select count(distinct custno) as "Total Ativos" 
from custp
left join xalog2 
on xalog2.custno = custp.no
and xalog2.date > 20151231
where xalog2.custno is not null and custno not in (1,2,3,4,5,6,7,8,9,10,11)

308548
select count(*) from custp; 652860

drop table if exists clientes3;
create temporary table clientes3
select distinct no as codigo, 
       name as nome,
       (birthday) as datanascimento, 
       ifnull(email, "Não declarado")    as email, 
       nei1     as bairro, 
       Case mar_status
       when 0 then "Solteiro"
       when 1 then "Casado"
       when 2 then "Divorciado"
       when 3 then "Viuvo"
       when 4 then "Outros"
       end as estadocivil,
       (sincedt)  as datacadastro, 
       (sum(comprovada)/100)  as renda, 
       (purlastdt) as ultimaCompra
from custp
left join ctrenda
on ctrenda.custno = custp.no
where 
(ctrenda.auxShort1 = 0 or ctrenda.auxShort1 is null) 
and purlastdt > "20151231"
and custp.no not in (1,2,3,4,5,6,7,8,9,10,11,100)
group by custp.no
order by rand()
;

drop table if exists clientestotais;
create temporary table clientestotais
select count(*) as total
from clientes3;

select count(codigo) as total, round(count(codigo)*3/100,0) as porcento from clientes3;

drop table if exists clientes4;
create temporary table clientes4
select * from clientes3
limit 9313



drop table if exists vendasclientes;
create temporary table vendasclientes
select codigo, 
       nome,
       datanascimento, 
       email, 
       bairro, 
       estadocivil,
       datacadastro, 
       renda,
       pxa.amt-pxa.discount+pxa.acc_amt as valor,
       ultimaCompra
from clientes4
inner join sqlpdv.pxa
on clientes4.codigo = pxa.custno
left join xalog2 
on xalog2.xano = pxa.xano 
and xalog2.storeno = pxa.storeno
and xalog2.pdvno = pxa.pdvno 
where 
 (xalog2.icm_aliq&pow(2,3))=0
and pxa.date > 20151231
group by pxa.xano, pxa.storeno, pxa.pdvno;


select 
       codigo, 
       nome,
       datanascimento, 
       email, 
       bairro, 
       estadocivil,
       datacadastro, 
       renda,
       count(valor) as quantidade,
       round(sum(valor)/count(valor)/100,2) as ticketMedio, 
       ultimaCompra
from vendasclientes
group by codigo;


select * from sqlpdv.pxa where nfse <> "IF" AND nfse <> "XA";
select * from custp where no = 458677;
select * from ctrenda where custno = 629110;


create temporary table luiza
select  no as codigo, 
       name as nome,
       date_format(birthday,"%d/%m/%Y") as datanascimento, 
       email    as email, 
       nei1     as bairro, 
       Case mar_status
       when 0 then "Solteiro"
       when 1 then "Casado"
       when 2 then "Divorciado"
       when 3 then "Viuvo"
       when 4 then "Outros"
       end as estadocivil,
       sincedt  as datacadastro, 
       (comprovada)  as renda,
       round((pxa.amt-pxa.discount-pxa.acc_amt),2)/100 as media,
       (pxa.xano) as quantidade,  
       pxa.storeno, 
       pxa.pdvno, 
       pxa.date
      
from sqlpdv.pxa 
left join custp
on pxa.custno = custp.no
and pxa.date > 20151231
left join ctrenda
on ctrenda.custno = custp.no
left join xalog2 
on xalog2.xano = pxa.xano 
and xalog2.storeno = pxa.storeno
and xalog2.pdvno = pxa.pdvno 
where pxa.custno is not null 
and (ctrenda.auxShort1 = 0 or ctrenda.auxShort1 is null) 
and pxa.custno not in (1,2,3,4,5,6,7,8,9,10,11,100)
and custp.no = 458677
and (xalog2.icm_aliq&pow(2,3))=0
group by pxa.xano
;


select * from custp where custp.no = 458677;


select distinct icm_aliq from xalog2;



select count(*) from perfilClientes;
GO

create view perfilClientes as
                select distinct no as codigo,
                       name as nome,
                       date_format(birthday,"%d/%m/%Y") as datanascimento,
                       ifnull(email, "Não declarado")    as email,
                       nei1     as bairro,
                       Case mar_status
                       when 0 then "Solteiro"
                       when 1 then "Casado"
                       when 2 then "Divorciado"
                       when 3 then "Viuvo"
                       when 4 then "Outros"
                       end as estadocivil,
                       date_format((sincedt),"%d/%m/%Y")  as datacadastro,
                       round((comprovada)/100,2)  as renda,
                       (purlastdt) as ultimaCompra ,
                       (x.amt-x.discount+x.acc_amt/100) as valor, 
                       (1) as qtde
                       
                from sqlpdv.pxa as x
                inner join custp
                on x.custno = custp.no
                left join ctrenda
                on ctrenda.custno = custp.no
                
                where
                (ctrenda.auxShort1 = 0 or ctrenda.auxShort1 is null)
                and purlastdt > "20151231"
               // and custp.no not in (1,2,3,4,5,6,7,8,9,10,11,100)
               // and x.icm_aliq <> 8
                and custp.no = 458677
               // group by custp.no
               // order by rand();
GO


select * from custp where name like '%luiza bandeira%';

select (amt-discount)/100, date, xano, storeno, pdvno from sqlpdv.pxa where custno = 458677


select round(sum(amt)/count(amt)/100,2) as mediaCompras, codigo, nome, 
date_format(datanascimento,"%d/%m/%Y") as datanascimento, email, 
bairro, estadocivil, date_format(datacadastro,"%d/%m/%Y") as datacadastro, 
renda, date_format(ultimaCompra,"%d/%m/%Y") as ultimaCompra
 from perfilClientes as c
inner join sqlpdv.pxa as p
on p.custno = c.codigo
left join eord as e
on e.ordno = p.eordno
and e.storeno = p.storeno
//where codigo = 458677
and (dataEntrega = 0 or dataEntrega is null) 
group by codigo;

select * from eord where custno = 458677;

select round(sum(amt)/count(amt)/100,2) as mediaCompras, codigo, nome,
                          date_format(datanascimento,"%d/%m/%Y") as datanascimento, email,
                          bairro, estadocivil, date_format(datacadastro,"%d/%m/%Y") as datacadastro,
                          renda, date_format(ultimaCompra,"%d/%m/%Y") as ultimaCompra
                           from perfilClientes as c
                          inner join sqlpdv.pxa as p
                          on p.custno = c.codigo
                          left join eord as e
                          on e.ordno = p.eordno
                          and e.storeno = p.storeno
                          and (dataEntrega = 0 or dataEntrega is null)
                          group by codigo
                          limit 9417;
                          
                          select * from perfilClientes;
                          select count(codigo) as total, round(count(codigo)*3/100,0) as porcento from perfilClientes;

drop view perfilClientes;                          
create view perfilClientes as

                select distinct no as codigo,
                       name as nome,
                       date_format(birthday,"%d/%m/%Y") as datanascimento,
                       ifnull(email, "Não declarado")    as email,
                       nei1     as bairro,
                       Case mar_status
                       when 0 then "Solteiro"
                       when 1 then "Casado"
                       when 2 then "Divorciado"
                       when 3 then "Viuvo"
                       when 4 then "Outros"
                       end as estadocivil,
                       date_format((sincedt),"%d/%m/%Y")  as datacadastro,
                       round((comprovada)/100,2)  as renda,
                       date_format(purlastdt,"%d/%m/%Y") as ultimaCompra 
                from custp
                left join ctrenda
                on ctrenda.custno = custp.no 
                where
                (ctrenda.auxShort1 = 0 or ctrenda.auxShort1 is null)
                and purlastdt > "20151231"
                and custp.no not in (1,2,3,4,5,6,7,8,9,10,11,100)
                group by custp.no
                order by rand();
GO

create view ticketMedio as
select round(sum(amt)/count(amt)/100,2) as mediaCompras, codigo, nome,
                          date_format(datanascimento,"%d/%m/%Y") as datanascimento, email,
                          bairro, estadocivil, date_format(datacadastro,"%d/%m/%Y") as datacadastro,
                          renda, date_format(ultimaCompra,"%d/%m/%Y") as ultimaCompra
                           from perfilClientes as c
                          inner join sqlpdv.pxa as p
                          on p.custno = c.codigo
                          left join eord as e
                          on e.ordno = p.eordno
                          and e.storeno = p.storeno
                          and (dataEntrega = 0 or dataEntrega is null)
                          group by codigo
                          limit 9417;
                          
                          
                          select * from perfilClientes limit 100;