# make a taxonomy tree of all the birds on NCBI 
using Pkg; Pkg.activate(".")
using Taxonomy
using NCBITaxonomy

procs = ncbi"Procellariiformes"
birds = ncbi"Aves"

birdtaxonomy = taxonomy(NCBITaxonWrapper(birds), FlexibleRankClassificationTree)
proctaxonomy = taxonomy(NCBITaxonWrapper(procs), FlexibleRankClassificationTree)

proctaxonomy ∈ birdtaxonomy == true

birdtaxonomy ∈ proctaxonomy == false