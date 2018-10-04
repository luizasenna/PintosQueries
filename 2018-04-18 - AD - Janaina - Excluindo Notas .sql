select * from avaliacoes
/*
37		Avaliação JANEIRO 2017
38		Avaliação FEVEREIRO 2017
39		Avaliação MARÇO 2017
40		Avaliação ABRIL 2017
41		Avaliação MAIO 2017
42		Avaliação JUNHO 2017
43		Avaliação JULHO 2017
44	Avaliação AGOSTO 2017
45	0	Avaliação SETEMBRO 2017
46  Avaliação OUTUBRO 2017
*/

select * from participantes where CHAPAAVALIADO = '110692' and CODAVALIACAO in (37,38,40);

delete from notas where CODPARTICIPANTE in (75639,77745,79779);

select * from participantes where CHAPAAVALIADO = '110301' and CODAVALIACAO in (38,39,40);
select * from notas where CODPARTICIPANTE in (78105,77064,79119);

select * from participantes where CHAPAAVALIADO = '110732' and CODAVALIACAO in (45);
delete from notas where CODPARTICIPANTE in (85920);

select * from licenciados where CODPARTICIPANTE = 86126;

select * from participantes where CHAPAAVALIADO = '030489' and CODAVALIACAO = 38;

select * from notas where CODPARTICIPANTE = 77817