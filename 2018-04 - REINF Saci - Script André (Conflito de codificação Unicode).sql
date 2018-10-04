SET SQL_SAFE_UPDATES=0;
SET SQL_BIG_SELECTS=1;

DROP TABLE IF EXISTS insere_inv;

UPDATE sqldados.inv INNER JOIN sqldados.vend ON (inv.vendno = vend.no) SET cfo = IF(vend.state="PI","1933","2933") 
WHERE 
    (inv.amtIRRF>0 OR inv.amtISS>0 OR inv.amtINSS>0 OR inv.auxMoney3>0 OR inv.auxMoney4>0 OR inv.auxMoney5>0) AND inv.storeno IN (1,3,5,6,8,9,10,11,12) AND (inv.date BETWEEN 20180301 AND 20180430);

CREATE TEMPORARY TABLE insere_rinv1
SELECT
    inv.storeno,
    inv.invno,
    inv.date,
    inv.amtServicos,
    IF(vend.state="PI","1933","2933")  as cfop
FROM
    sqldados.inv
INNER JOIN
    sqldados.vend ON (inv.vendno = vend.no)
LEFT JOIN
    sqldados.iprd ON (inv.invno = iprd.invno)
WHERE
    (inv.amtIRRF>0 OR inv.amtISS>0 OR inv.amtINSS>0 OR inv.auxMoney3>0 OR inv.auxMoney4>0 OR inv.auxMoney5>0)
    AND inv.storeno IN (1,3,5,6,8,9,10,11,12)
    AND (inv.date BETWEEN 20180301 AND 20180430)
    AND iprd.invno IS NULL
GROUP BY
    inv.invno;


select * from insere_rinv1;
INSERT INTO sqldados.iprd (invno, qtty, fob, cost, date, ipi, auxLong1, auxLong2, frete, seguro, despesas, freteIpi, qttyRessar, baseIcmsSubst, icmsSubst, icms, discount, fob4, cost4, icmsAliq, cfop, auxLong3, auxLong4, auxLong5, auxMy1, auxMy2, auxMy3, baseIcms, baseIpi, ipiAmt, reducaoBaseIcms, lucroTributado,l1,l2,l3,l4,l5,l6,l7,l8,m1,m2,m3,m4,m5,m6,m7,m8, storeno, bits, auxShort1, auxShort2, taxtype, auxShort3, auxShort4, auxShort5, seqno, bits2, bits3, bits4, s1, s2, s3, s4, s5, s6, s7, s8, prdno, grade, auxChar, auxChar2, cstIcms, cstIpi, c1)
SELECT
    insere_rinv1.invno,
    1000,
    insere_rinv1.amtServicos,
    0,
    insere_rinv1.date,
    0,
    0,0,
    0,
    0,
    0, 
    0,
    0,
    0,  
    0,
    0,
    0,
    insere_rinv.amtServicos*100,
    0,
    0,
    insere_rinv.cfop,
    0,0,0,
    0,0,0, 
    0,
    0,
    0,
    0,
    0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    insere_rinv.storeno,
    512,
    0,0,
    0,
    0,0,0,
    0,
    0,0,0,
    0,0,0,0,0,0,0,0,
    LPAD(313447,16,' '),
    "",
    "","",
    "041",
    "",
    ""
FROM
    sqldados.insere_rinv;

INSERT INTO sqldados.iprdpis (invno, aliqPis, aliqCofins, basePis, baseCofins, pisAmt, cofinsAmt, pisRetido, cofinsRetido, pisRetidoSt, cofinsRetidoSt, creditoPis, creditoCofins, auxLong1, auxLong2, auxLong3, auxLong4, auxLong5, auxLong6, auxLong7, auxLong8, auxLong9, auxLong10, auxMy1, auxMy2, auxMy3, auxMy4, auxMy5, auxMy6, auxMy7, auxMy8, auxMy9, auxMy10, cstPis, cstCofins, codigoBaseCredito, tipoCredito, bits, bits2, auxShort1, auxShort2, auxShort3, auxShort4, auxShort5, auxShort6, auxShort7, auxShort8, auxShort9, auxShort10, prdno, grade, auxStr1, auxStr2, auxStr3, auxStr4, auxStr5, auxStr6, auxStr7, auxStr8)
SELECT
    insere_rinv.invno,
    0,
    0, 
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,
    0,
    0,
    0,
    0,
    0,0,
    0,0,0,0,0,0,0,0,0,0,
    LPAD(313447,16,' '),
    "",
    "",spedprd.codlst,"","","","","",""
FROM
    sqldados.insere_rinv, sqldados.spedprd
WHERE
    spedprd.prdno = 313447;
 

INSERT INTO sqldados.iprdpis (invno, aliqPis, aliqCofins, basePis, baseCofins, pisAmt, cofinsAmt, pisRetido, cofinsRetido, pisRetidoSt, cofinsRetidoSt, creditoPis, creditoCofins, auxLong1, auxLong2, auxLong3, auxLong4, auxLong5, auxLong6, auxLong7, auxLong8, auxLong9, auxLong10, auxMy1, auxMy2, auxMy3, auxMy4, auxMy5, auxMy6, auxMy7, auxMy8, auxMy9, auxMy10, cstPis, cstCofins, codigoBaseCredito, tipoCredito, bits, bits2, auxShort1, auxShort2, auxShort3, auxShort4, auxShort5, auxShort6, auxShort7, auxShort8, auxShort9, auxShort10, prdno, grade, auxStr1, auxStr2, auxStr3, auxStr4, auxStr5, auxStr6, auxStr7, auxStr8)
SELECT
    insere_rinv.invno,
    0,
    0, 
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,
    0,
    0,
    0,
    0,
    0,0,
    0,0,0,0,0,0,0,0,0,0,
    LPAD(313447,16,' '),
    "",
    "",spedprd.codlst,"","","","","",""
FROM
    sqldados.insere_rinv, sqldados.spedprd
WHERE
    spedprd.prdno = 313447;
 
 SELECT
    insere_rinv.invno,
    0,
    0, 
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,
    0,
    0,
    0,
    0,
    0,0,
    0,0,0,0,0,0,0,0,0,0,
    LPAD(313447,16,' '),
    "",
    "",spedprd.codlst,"","","","","",""
FROM
    sqldados.insere_rinv, sqldados.spedprd
WHERE
    spedprd.prdno = 313447;   
    
    
    
    
    
    
    
