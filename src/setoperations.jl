"""
    base dispatch for formal subset on taxonomies. 

    a is formally a subset of A, even if they are identical,
    e.g. a = [1,2,3] and A = [1,2,3].

    returns true if a ⊆ A, false otherwise. 
"""
function Base.:⊆(a::AbstractTaxonomy, A::AbstractTaxonomy)
    # how can this evaluate false? 
    # 1. a is lower in rank than A, but a is not a clade of A
    # 2. a is higher rank than A, so function call doesn't make sense. throw warning 
    # 3. a and A are not the same type of taxonomy, so function call doesn't make sense. throw error

    # how does this evaluate true?
    # 1. All of the species in a are also in A
    # 2. a is exactly the same as A  
end

"""
    base dispatch for strict subset on taxonomies. 

    a = [1,2,3] and A = [1,2,3] yields a ⊊ A = false,
    where a = [1,2] with the same A would yield a ⊊ A = true.

    returns true if a ⊊ A, false otherwise. 
"""
function Base.:⊊(a::AbstractTaxonomy, A::AbstractTaxonomy)
    # how can this evaluate false? 
    # 1. a is lower or equal to the rank than A, but a is not a clade of A
    # 2. a is higher rank or equal in rank to A, so function call doesn't make sense. throw warning 
    # 3. a and A are not the same type of taxonomy, so function call doesn't make sense. throw error

    # how does this evaluate true?
    # 1. All of the species in a are also in A and a is a lower rank than A
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

"""
    Base.:∩(A::AbstractTaxonomy, B::AbstractTaxonomy)

    Base dispatch for intersection of two taxonomies.

    Should return a taxonomy with the set of taxa 
    that exist within both `A` and `B`.
"""
function Base.:∩(A::AbstractTaxonomy, B::AbstractTaxonomy)
end

"""
    Base.∪:(A::AbstractTaxonomy, B::AbstractTaxonomy)

    Base dispatch for union of two taxnomies. 

    Should return a taxonomy with all of the species 
    combined between `A` and `B`.

"""
function Base.:∪(A::AbstractTaxonomy, B::AbstractTaxonomy)

    # Should throw an error if :
    #   A and B are not of the same taxonomy type
    # Should throw a warning if :
    #   No common taxa found, so A and B merged via polytomy at the root
    # Otherwise:
    #   should find the highest order rank within A and B and root there.
end