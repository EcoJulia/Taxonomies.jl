


struct TaxonNode{T <: AbstractTaxon}
    taxon::T
    parent::Union{TaxonNode, Nothing}
    children::Vector{TaxonNode}
end

"""
    TaxonNode(nctx::NCBITaxon)

    Constructor for TaxonNode with no parent (meaning it is the root of a tree).
"""
TaxonNode(nctx::AbstractTaxon)  = TaxonNode(nctx, nothing, TaxonNode[])

"""
    TaxonNode(nctx::NCBITaxon,  parent::TaxonNode)

    Constructor for TaxonNode with a parent 
"""
TaxonNode(nctx::AbstractTaxon, parent::TaxonNode) = TaxonNode(nctx, parent, TaxonNode[])


taxon(node::TaxonNode{NCBITaxonWrapper}) = node.taxon.val 


struct FlexibleRankClassificationTree <: AbstractTaxonomy
    root::TaxonNode
end 
struct FixedRankClassificationTree <: AbstractTaxonomy
    root::TaxonNode
end 

function AbstractTrees.children(node::TaxonNode)
    if isdefined(node, :children)
        return node.children
    end
    return []
end

function _addchild!(parent::TaxonNode, child::TaxonNode )
    push!(parent.children, child)
end

function _addnode!(newtaxon::AbstractTaxon, parent::TaxonNode)
    newnode = TaxonNode(newtaxon, parent)
    _addchild!(parent, newnode)

    return newnode
end