module Taxonomy
    using NCBITaxonomy: NCBITaxon
    using Phylo
    using AbstractTrees

    include(joinpath(".", "types.jl"))
    export AbstractTaxonomy, AbstractRank, AbstractTaxon, AbstractClassificationTree

    include(joinpath(".", "trees.jl"))
    export Taxa, TaxonomicRank

    include(joinpath(".", "taxonomies.jl"))
    export FixedRankTaxonomy, FlexibleRankTaxonomy
    export ranks, tree

    include(joinpath(".", "builders.jl"))
    export taxonomy
end 



