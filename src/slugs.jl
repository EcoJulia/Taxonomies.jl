testTaxa = "Pinus ponderosa"

function apicall(uri, t::NCBITaxon)
    genus, species = lower.(split(t.name))
    apicall(apicall(uri, genus), species)
end 

function apicall(uri, species)
    # replace %s with species name
    specstr = species
    replace(uri, r"%s" => specstr)
end 

function apicall(uri, genus)
    # replace %s with species name
    specstr = species
    replace(uri, r"%s" => specstr)
end 

function apicall(uri, location::AbstractLocation)
    # replace %l with location
    locstr = location

    replace(uri, r"%l" => locstr)
end

const FISHBASE_TAXONOMY_GENUS_SPECIES = "https://fishbase.ropensci.org/taxa/?Genus=%g,Species=%s"
const FISHBASE_TAXONOMY_GENUS = "https://fishbase.ropensci.org/taxa/?Genus=%g"
