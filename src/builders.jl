"""
    taxonomy(tx::NCBITaxon)

    Builds a taxonomy with `tx` at the root by running
    breadth-first search. 

"""
function taxonomy(tx::AbstractTaxon, tree::Type{T}) where {T <: AbstractTaxonomy}
    root = TaxonNode(tx)
    _taxonomy!(root, tree)

    return _taxonomy(tree(root))
end

"""
    _taxonomy(tree::T) 

    all natural, organic, free-range depth-first search
"""
function _taxonomy(tree::FixedRankClassificationTree)
    return FixedRankTaxonomy(tree)

end
function _taxonomy(tree::FlexibleRankClassificationTree)
    return FlexibleRankTaxonomy(tree)
end

"""
    _taxonomy(root::AbstractTaxon, tree::T) 

    all natural, organic, free-range depth-first search
"""
function _taxonomy!(root::TaxonNode{T}, tree::Type{V}) where {T <: NCBITaxonWrapper,V <: FixedRankClassificationTree}
    currentnode = root
    for child in NCBITaxonomy.children(taxon(currentnode))

        # todo, don't add to tree if this taxon is not one of the fixed ranks in tree
        # (tree == FixedClassificationTree) && isfixedrank(taxon(child), tree)
        
        newnode = _addnode!(NCBITaxonWrapper(child), currentnode)
        _taxonomy!(newnode, tree)
    end
end


function _taxonomy!(root::TaxonNode{T}, tree::Type{V}) where {T <: NCBITaxonWrapper,V <: FlexibleRankClassificationTree}
    currentnode = root
    for child in NCBITaxonomy.children(taxon(currentnode))

        # todo, don't add to tree if this taxon is not one of the fixed ranks in tree
        # (tree == FixedClassificationTree) && isfixedrank(taxon(child), tree)
        
        newnode = _addnode!(NCBITaxonWrapper(child), currentnode)
        _taxonomy!(newnode, tree)
    end
end
