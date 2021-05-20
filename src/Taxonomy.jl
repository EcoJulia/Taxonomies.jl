module Taxonomy
    using NCBITaxonomy
    using Phylo
    using AbstractTrees

    include(joinpath(".", "types.jl"))
    export AbstractTaxonomy, AbstractRank, AbstractTaxon, AbstractClassificationTree, TaxonomicRank, NCBITaxonWrapper

    include(joinpath(".", "nodes.jl"))
    export TaxonNode
    
    include(joinpath(".", "trees.jl"))
    export FixedRankClassificationTree, FlexibleRankClassificationTree

    include(joinpath(".", "taxonomies.jl"))
    export FixedRankTaxonomy, FlexibleRankTaxonomy
    export ranks, tree, defaultranks

    include(joinpath(".", "builders.jl"))
    export taxonomy
end 



