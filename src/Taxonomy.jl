module Taxonomy
    using NCBITaxonomy: NCBITaxon

    include(joinpath(".", "types.jl"))
    export AbstractTaxonomy, AbstractRank, AbstractTaxa, AbstractClassificationTree

    include(joinpath(".", "taxa.jl"))

    include(joinpath(".", "trees.jl"))

    include(joinpath(".", "taxonomies.jl"))

end # module
