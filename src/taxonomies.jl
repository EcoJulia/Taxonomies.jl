
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
    root::Union{TaxonNode, Nothing}
    FixedRankTaxonomy(root::TaxonNode; ranks = defaultranks()) = new(ranks, root)
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
    root::Union{TaxonNode, Nothing}
    FlexibleRankTaxonomy(root::TaxonNode; ranks = defaultranks()) = new(ranks, root)
end 

tree(t::AbstractTaxonomy) = t.tree
ranks(t::AbstractTaxonomy) = t.ranks
root(t::AbstractTaxonomy) = t.root

Base.show(io::IO,t::FlexibleRankTaxonomy) = Base.show(io, AbstractTrees.print_tree(root(t)))
Base.show(io::IO, t::FixedRankTaxonomy) = Base.show(io, AbstractTrees.print_tree(root(t)))

defaultranks() = [TaxonomicRank(Symbol(s),i-1) for (i,s) in enumerate(["domain", "kingdom", "phylum", "class", "order", "family", "genus", "species"])]
