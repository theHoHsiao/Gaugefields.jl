abstract type Gaugefields_2D{NC} <: AbstractGaugefields{NC,2} end

@require MPI = "da04e1cc-30fd-572f-bb4f-1f8673147195" begin

    include("./gaugefields_2D_mpi_nowing.jl")
        
end

include("./gaugefields_2D_wing.jl")
include("./gaugefields_2D_nowing.jl")
include("./Isingfields_2D.jl")
include("mpi_jacc/gaugefields_2D_MPILattice.jl")

function Base.size(U::Gaugefields_2D{NC}) where {NC}
    return NC, NC, U.NX, U.NT
end


function clear_U!(U::Array{T,1}) where {T<:Gaugefields_2D}
    for μ = 1:2
        clear_U!(U[μ])
    end

end
