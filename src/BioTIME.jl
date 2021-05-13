module BioTIME

using TimeSeries
using DataFrames
using NCBITaxonomy

if !haskey(ENV, "BIOTIME_PATH")
    @warn """
    The environmental variabe BIOTIME_PATH is not set, so the data will
    be stored in the package path. This is not ideal, and you really should set
    the BIOTIME_PATH.
    """
end
const taxpath = get(ENV, "BIOTIME_PATH", joinpath(@__DIR__, "..", "deps"))
ispath(taxpath) || mkpath(taxpath)


end # module
