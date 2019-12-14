module AD

using ..NiLang
using NiLangCore
using Reexport
@reexport using NiLangCore.ADCore
using MLStyle

import ..NiLang: ⊕, ⊖, NEG, CONJ, ROT, IROT, SWAP
include("basicinstructs.jl")
include("instructs.jl")

for op in [:>, :<, :>=, :<=, :isless]
    @eval Base.$op(a::Bundle, b::Bundle) = $op(value(a), value(b))
end
#Base.conj(x::GVar) = GVar(x.x', x.g')
end
