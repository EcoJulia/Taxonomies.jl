module Taxonomy
    using NCBITaxonomy: NCBITaxon

    include(joinpath(".", "types.jl"))
    export AbstractTaxonomy, AbstractRank, AbstractTaxa, AbstractClassificationTree

    include(joinpath(".", "taxa.jl"))
    export Taxa, TaxonomicRank

    include(joinpath(".", "trees.jl"))

    include(joinpath(".", "taxonomies.jl"))
    export FixedRankTaxonomy, FlexibleRankTaxonomy
end # module

