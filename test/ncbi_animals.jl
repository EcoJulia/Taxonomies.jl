# make a taxonomy tree of all the animals on NCBI 
using Pkg; Pkg.activate(".")
using Taxonomy
using NCBITaxonomy

mz = ncbi"Metazoa"



# build a taxonomy of metazoa with 
# each level in the tree corresponding to domain kingdom phylum etc (as described by NormalTaxonomy). 
taxonomy(NCBITaxonWrapper(mz))

