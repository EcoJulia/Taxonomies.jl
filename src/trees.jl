
struct TaxonomicRank
    name::String
    depth::Int 
end

struct TaxonNode{T <: AbstractTaxon}
    taxon::T
    rank::TaxonomicRank
    parent::TaxonNode
    children::Vector{TaxonNode}
end

struct FlexibleRankClassificationTree <: AbstractClassificationTree end 
struct FixedRankClassificationTree <: AbstractClassificationTree end 
