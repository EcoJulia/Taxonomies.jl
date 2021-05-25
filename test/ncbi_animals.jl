# make a taxonomy tree of all the birds on NCBI 
using Pkg; Pkg.activate(".")
using Taxonomy
using NCBITaxonomy

taxon = ncbi"Procellariiformes"

@time proc_taxonomy = taxonomy(NCBITaxonWrapper(taxon), FixedRankTaxonomy)
