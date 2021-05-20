# make a taxonomy tree of all the birds on NCBI 
using Pkg; Pkg.activate("..")
using Taxonomy
using NCBITaxonomy

mz = ncbi"Aves"

# build a taxonomy of Aves, takes about 1 minute on my laptop
@time taxonomy(NCBITaxonWrapper(mz), FlexibleRankClassificationTree)

