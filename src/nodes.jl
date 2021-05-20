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
    TaxonNode(nctx::NCBITaxon,  parent::NCBITaxon)

    Constructor for TaxonNode with a parent 
"""
TaxonNode(nctx::AbstractTaxon, parent::AbstractTaxon) = TaxonNode(nctx, parent, [])
