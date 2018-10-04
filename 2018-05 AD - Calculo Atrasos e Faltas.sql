select * from atrasosfaltas as at
inner join abonoslancados as ab
on ab.CODPESSOA = at.CODPESSOA and year(ab.DATA) = at.ANO and month(ab.DATA) = at.MES

update abonoslancados as al 
inner join funcionarios as f on f.CHAPA = al.CHAPA
set al.CODPESSOA = f.CODPESSOA;

select (at.MINUTOS + FALTA + IFNULL(ab.ABONO,0))/60 as total, at.CODPESSOA, at.ANO, at.MES from atrasosfaltas as at
left join abonoslancados as ab
on ab.CODPESSOA = at.CODPESSOA and at.ANO = ab.ANO and at.MES = ab.MES
where at.CODPESSOA = 3319
group by at.CODPESSOA, at.ANO, at.MES, at.CODPESSOA