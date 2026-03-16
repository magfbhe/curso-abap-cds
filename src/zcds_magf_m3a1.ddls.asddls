// Cds Hierarquica
define hierarchy ZCDS_MAGF_M3A1 
    as parent child hierarchy( 
    source ZCDS_MAGF_M3A1_MAIN
    child to parent association _manager
    //start where elname = value - Filtro especifico, tipo um unico centro de custo
    siblings order by EmpId ascending
     )
{
 EmpId,
 EmpName,
 ManagerId,
 CostCenter,
 $node.hierarchy_level as hier_lvl,               //Nível do nó na hierarquia - 1 = nó raiz, 2 = filho direto, 3 = neto, etc.
 $node.hierarchy_rank as hier_rank,               //Posição sequencial do nó na hierarquia - Usado para ordenação hierárquica consistente
 $node.hierarchy_is_orphan as hier_orphan,        //Indica se o nó é órfão - 'X' = não encontrou o pai via associação _manager / ' ' = nó corretamente ligado à hierarquia
 $node.hierarchy_parent_rank as hier_parent_rank, //hierarchy_rank do nó pai - Permite identificar a relação pai → filho
 $node.hierarchy_tree_size as hier_tree_size,     //Quantidade total de nós na subárvore - Inclui o próprio nó + todos os descendentes
 $node.node_id as id_node,                        //Identificador técnico interno do nó na hierarquia - Gerado automaticamente pelo framework CDS
 $node.parent_id as id_parent                     //Identificador técnico do nó pai - Corresponde ao node_id do pai
}
