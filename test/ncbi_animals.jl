# make a taxonomy tree of all the birds on NCBI 
using Pkg; Pkg.activate("..")
using Taxonomy
using AbstractTrees
using NCBITaxonomy

av = ncbi"Procellariiformes"

# build a taxonomy of Aves, takes about 1 minute on my laptop   
@time tax = taxonomy(NCBITaxonWrapper(av), FlexibleRankClassificationTree)
