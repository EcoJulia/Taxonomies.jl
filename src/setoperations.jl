"""
    base dispatch for subset on taxonomies. 

    returns true if a ∈ A, false otherwise. 
"""
function Base.:⊆(a::AbstractTaxonomy, A::AbstractTaxonomy)
    # how can this evaluate false? 
    # 1. a is lower order classifciation than A, but a is not a clade of A
    # 2. a is higher order classification than A, so function call doesn't make sense. throw warning 
    # 3. a and A are not the same taxonomy, so throw error

    # how does this evaluate true?
    # 1. All of the species in a are also in A
    # 2. a is exactly the same as A  
end

"""
    Base.:∈(a::AbstractTaxonomy, A::AbstractTaxonomy) 

    Evaluates same as ⊆(a,A) .
"""
Base.:∈(a::AbstractTaxonomy, A::AbstractTaxonomy) = Base.:⊆(a,A) 

"""
    Base.:⊂(a::AbstractTaxonomy, A::AbstractTaxonomy)

    Sadly i think we need to decide whether this symbol means
    formal subset or strict subset. 
"""
function Base.:⊂(a::AbstractTaxonomy, A::AbstractTaxonomy)
end 