"""
    taxonomy(tx::NCBITaxon)

    Builds a taxonomy with `tx` at the root by running
    breadth-first search. 

"""
function taxonomy(tx::AbstractTaxon, txnmytype::Type{T}) where {T <: AbstractTaxonomy}
    root = TaxonNode(tx, TaxonomicRank(rank(tx.val),0)) # no good 

    txnmy = txnmytype(root)
    _taxonomy!(root, txnmy)

    return txnmy
end


"""
    _taxonomy!(root::TaxonNode{T}, tree::T) 

    all natural, organic, free-range depth-first search.
"""
function _taxonomy!(root::TaxonNode{T}, tax::FixedRankTaxonomy) where {T <: NCBITaxonWrapper}
    currentnode = root
    for child in NCBITaxonomy.children(taxon(currentnode))
        childrank = rank(child)
        if _isfixedrank(childrank, ranks(tax))
            newnode = _addnode!(NCBITaxonWrapper(child), childrank, currentnode)
            _taxonomy!(newnode, tax)
        end
    end
end

function _isfixedrank(rank, ranks)
    retval =  rank ∈ [r.name for r in ranks] # slow 
    return retval
end


function _taxonomy!(root::TaxonNode{T}, tax::Type{FlexibleRankTaxonomy}) where {T <: NCBITaxonWrapper}
    currentnode = root
    for child in NCBITaxonomy.children(taxon(currentnode))
        newnode = _addnode!(NCBITaxonWrapper(child), currentnode)
        _taxonomy!(newnode, tax)
    end
end
