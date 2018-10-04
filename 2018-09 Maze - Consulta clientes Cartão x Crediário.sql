select 
    custno as codigo,
    name as nome,  
    date_format(birthday, "%d/%m/%Y") as nascimento,  
    crlimit as LimiteCredito,  
    cpf_cgc as cpf, 
    round(puraccotn,2) as comprasAcumuladas,
    round(purbigotn,2) as maiorCompra, 
    purlastotn as ultimaCompra,
    date_format(purlastdt, "%d/%m/%Y") as ultimaDataCompra,
    sum(if(xatype=3,1,0)) as vendaCartao,
    sum(if(xatype=0,1,0)) as vendaDinheiro,
    sum(if(xatype=5,1,0)) as vendaCrediario 
from xalog2
left join custp 
on custp.no = xalog2.custno
where purlastdt >= 20150101  and custno not in (1,2,
3,
4,
5,
10,
11,
12,
13,
64,
100,32000)
group by custno
Having vendaCartao > 0 
and vendaCrediario = 0