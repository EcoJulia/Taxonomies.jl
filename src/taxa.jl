struct TaxonomicRank{T} where {T <: AbstractTaxonomy}
end


struct Taxa{T} where {T <: AbstractTaxonomy}
    rank::TaxonomicRank{T}
end 

