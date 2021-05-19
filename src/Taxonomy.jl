module Taxonomy
    using NCBITaxonomy: NCBITaxon
    using Phylo
    using AbstractTrees

    include(joinpath(".", "types.jl"))
    export AbstractTaxonomy, AbstractRank, AbstractTaxon, AbstractClassificationTree, TaxonomicRank


    include(joinpath(".", "trees.jl"))
    export TaxonNode, FixedRankClassificationTree, FlexibleRankClassificationTree

    include(joinpath(".", "taxonomies.jl"))
    export FixedRankTaxonomy, FlexibleRankTaxonomy
    export ranks, tree, defaultranks


    include(joinpath(".", "builders.jl"))
    export taxonomy
end 



