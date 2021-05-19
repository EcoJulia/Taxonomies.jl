struct TaxonNode{T <: AbstractTaxon}
    taxon::T
    rank::TaxonomicRank
    treedepth::Int
    parent::TaxonNode
    children::Vector{TaxonNode}
end

struct FlexibleRankClassificationTree <: AbstractClassificationTree 
    root::TaxonNode
end 
struct FixedRankClassificationTree <: AbstractClassificationTree 
    root::TaxonNode
end 
