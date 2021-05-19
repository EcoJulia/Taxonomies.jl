"""
    taxonomy(tx::NCBITaxon)

    Builds a taxonomy with `tx` at the root by running
    breadth-first search. 

"""
function taxonomy(tx::NCBITaxon)
    root = TaxonNode(tx)
    

end

function _taxonomy(root::AbstractTaxon, tree::T) where {T <: AbstractTaxonomy}

end

