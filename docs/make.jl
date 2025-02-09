using Documenter, NiLang
using SparseArrays

using Literate
tutorialpath = joinpath(@__DIR__, "src/examples")
sourcepath = joinpath(dirname(@__DIR__), "examples")
for jlfile in ["besselj.jl", "sparse.jl", "sharedwrite.jl", "qr.jl", "port_zygote.jl", "fib.jl", "unitary.jl", "nice.jl", "realnvp.jl", "boxmuller.jl", "lognumber.jl", "pyramid.jl"]
    Literate.markdown(joinpath(sourcepath, jlfile), tutorialpath)
end

# Pluto pages
import Pkg

Pkg.add([
Pkg.PackageSpec(url="https://github.com/GiggleLiu/PlutoUtils.jl", rev="static-export"),
Pkg.PackageSpec(url="https://github.com/fonsp/Pluto.jl", rev="05e5b68"),
]);

makedocs(;
    modules=[NiLang],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
        "What and Why" => "why.md",
        "Tutorial" => Any[
            "tutorial.md",
            "examples/port_zygote.md",
           ],
        "Examples" => Any[
            "examples/fib.md",
            "examples/pyramid.md",
            "examples/besselj.md",
            "examples/sparse.md",
            "examples/lognumber.md",
            "examples/unitary.md",
            "examples/nice.md",
            "examples/realnvp.md",
            "examples/qr.md",
            "examples/boxmuller.md",
           ],
        "API & Manual" => Any[
            "instructions.md",
            "extend.md",
            "examples/sharedwrite.md",
            "api.md",
            "faq.md",
           ]
    ],
    repo="https://github.com/GiggleLiu/NiLang.jl/blob/{commit}{path}#L{line}",
    sitename="NiLang.jl",
    authors="JinGuo Liu, thautwarm",
)

import PlutoUtils

PlutoUtils.Export.github_action(; notebook_dir=NiLang.project_relative_path("notebooks"), offer_binder=false, export_dir=NiLang.project_relative_path("docs", "build", "notebooks"), generate_default_index=false, project=NiLang.project_relative_path("docs"))


deploydocs(;
    repo="github.com/GiggleLiu/NiLang.jl.git",
)
