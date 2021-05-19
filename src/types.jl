abstract type AbstractTaxonomy end
abstract type AbstractClassificationTree end  
abstract type AbstractRank end 
abstract type AbstractTaxon end 

"""
    TaxonomicRank 

    A string describing the name of a rank of a taxonomy (e.g. Domain, Family, Genus), 
    and the corresponding depth of that rank in the taxonomy. 
"""
struct TaxonomicRank
    name::String
    taxonomydepth::Int 
end
