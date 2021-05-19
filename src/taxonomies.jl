
"""
    FixedRankTaxonomy


    What makes this a `FixedRankTaxonomy` is that within the
    ClassificationTree `tree`, the depth of each node corresponds
    to that index in `ranks`.
    
    To use a taxonomy that enables classifications that do not correspond
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

tree(t::AbstractTaxonomy) = t.tree
ranks(t::AbstractTaxonomy) = t.ranks


"""
    NormalTaxonomy is a FixedRankTaxonomy with the ranks (in order):
    `[Domain Kingdom Phylum Class Order Family Genus Species]`
    
    It should probably have a better name 
"""
NormalTaxonomy(tree::FixedRankClassificationTree) = FixedRankTaxonomy([TaxonomicRank(s,i) for (i,s) in enumerate(["Domain", "Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species"])], tree)
NormalTaxonomy(; tree = FixedRankClassificationTree()) = NormalTaxonomy(tree)
