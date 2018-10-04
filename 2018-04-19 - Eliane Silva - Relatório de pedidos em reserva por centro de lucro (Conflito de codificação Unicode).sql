select eoprd.storeno as loja,
       eord.date     as data, 
       eoprd.prdno   as produto, 
       eoprd.grade   as grade, 
       eoprd.empno   as vendedor
from eoprd
inner join prd on prd.no = eoprd.prdno
inner join eord on eord.ordno = eoprd.ordno
inner join emp on emp.no = eoprd.empno
where prd.clno between 210000 and 219999
and eord.date between 20170101 and 20171231
and eoprd.empno = 754
and eord.storeno = 10
and eoprd.status = 2 
group by eord.ordno


select * from emp where name like '%daniele viana%';

