
"""
    FixedTaxonomy

    FixedTaxonomy has the ranks (in order):
    `[Domain Kingdom Phylum Class Order Family Genus Species]`

    What makes this a `FixedTaxonomy` is that within the
    ClassificationTree `tree`, the depth of each node corresponds
    to that index in `ranks`.
    
    To use a taxnomy that enables classifications that do not correspond
    to a rank in `ranks`, e.g. super-class, sub-genera, sub-sub-family, etc,
    se `FlexibleTaxonomy`
    
"""
struct FixedRankTaxonomy <: AbstractTaxonomy 
    ranks::Vector{AbstractRank}
    tree::FixedRankClassificationTree
end 


struct FlexibleRankTaxonomy <: AbstractTaxonomy 
    ranks::Vector{AbstractRank}
    tree::FlexibleRankClassificationTree
end 