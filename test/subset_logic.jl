# make a taxonomy tree of all the birds on NCBI 
using Pkg; Pkg.activate(".")
using Taxonomy
using NCBITaxonomy

procs = ncbi"Procellariiformes"
birds = ncbi"Aves"

birdtaxonomy = taxonomy(NCBITaxonWrapper(birds), FixedRankTaxonomy)
proctaxonomy = taxonomy(NCBITaxonWrapper(procs), FixedRankTaxonomy)


# things that should be true
birdtaxonomy ∩ proctaxonomy == proctaxnomy
birdtaxonomy ∪ proctaxonomy == birdtaxonomy
birdtaxonomy ∈ proctaxonomy == false
proctaxonomy ∈ birdtaxonomy == true
