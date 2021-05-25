


struct TaxonNode{T <: AbstractTaxon}
    taxon::T
    rank::TaxonomicRank
    parent::Union{TaxonNode, Nothing}
    children::Vector{TaxonNode}
end

"""
    TaxonNode(nctx::NCBITaxon)

    Constructor for TaxonNode with no parent (meaning it is the root of a tree).
"""
TaxonNode(nctx::AbstractTaxon, rank::TaxonomicRank)  = TaxonNode(nctx, rank, nothing, TaxonNode[])

"""
    TaxonNode(nctx::NCBITaxon,  parent::TaxonNode)

    Constructor for TaxonNode with a parent 
"""
TaxonNode(nctx::AbstractTaxon, rank::TaxonomicRank, parent::TaxonNode) = TaxonNode(nctx, rank, parent, TaxonNode[])



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

AbstractTrees.printnode(io::IO, node::TaxonNode) = print(io, Taxonomy.taxon(node))


function _addchild!(parent::TaxonNode, child::TaxonNode )
    push!(parent.children, child)
end

function _addnode!(newtaxon::AbstractTaxon, rank::TaxonomicRank, parent::TaxonNode)
    newnode = TaxonNode(newtaxon, rank, parent)
    _addchild!(parent, newnode)

    return newnode
end