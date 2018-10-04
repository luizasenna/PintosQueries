select * from historicoequipamento
where  idequipamento = 2678;


select * from tipohistorico;


Equipamento::where('descricao', 'LIKE', '%'.$desc_filter.'%')
        ->where('equipamentos.status', '=', 0)
        ->leftJoin('historicoequipamento', 'equipamentos.id', '=', 'idequipamento')
        ->orderBy('equipamentos.id', 'desc');
        
        select * from equipamentos 
        left join historicoequipamento
        on equipamentos.id = idequipamento
        where historicoequipamento.status is null
        order by equipamentos.id;
        
        