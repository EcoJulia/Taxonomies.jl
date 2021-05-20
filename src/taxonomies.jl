
"""
    FixedRankTaxonomy


    What makes this a `FixedRankTaxonomy` is that within the
    ClassificationTree `tree`, the depth of each node `d` corresponds
    to the index `d` in `ranks`.
    
    To use a taxonomy that enables classifications that do not correspond
    to a rank in `ranks`, e.g. super-class, sub-genera, sub-sub-family, etc,
    see `FlexibleTaxonomy`
    
"""
struct FixedRankTaxonomy <: AbstractTaxonomy 
    ranks::Vector{TaxonomicRank}
    tree::Union{FixedRankClassificationTree, Nothing}
    FixedRankTaxonomy(; ranks = defaultranks()) = new(ranks, nothing)
    FixedRankTaxonomy(tree::FixedRankClassificationTree; ranks = defaultranks()) = new(ranks, tree)
end 


"""
    FlexibleRankTaxonomy
    
    A `FlexibleTaxonomy` contains a set of `TaxonomicRanks`,
    but does not enfore that the depth of each node `d` correspond
    to a rank; instead "between"-ranks separating
    named ranks can exist, and are described as being arbitrary numbers of either `super` or `sub`
    from the nearest named rank.
    
"""
struct FlexibleRankTaxonomy <: AbstractTaxonomy 
    ranks::Vector{TaxonomicRank}
    tree::Union{FlexibleRankClassificationTree, Nothing}
    FlexibleRankTaxonomy(tree::FlexibleRankClassificationTree; ranks = defaultranks()) = new(ranks, tree)
    FlexibleRankTaxonomy(; ranks = defaultranks()) = new(ranks, nothing)
end 

tree(t::AbstractTaxonomy) = t.tree
ranks(t::AbstractTaxonomy) = t.ranks

Base.show(io::IO,t::FlexibleRankTaxonomy) = Base.show(io, AbstractTrees.print_tree(tree(t).root))
Base.show(io::IO, t::FixedRankTaxonomy) = Base.show(io, AbstractTrees.print_tree(tree(t).root))

defaultranks() = [TaxonomicRank(s,i) for (i,s) in enumerate(["Domain", "Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species"])]
