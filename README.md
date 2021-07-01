# ParameterEstimateScatterPlots.jl

This Julia package exports `scatterestimates`,
a simple function that generates a scatter plot
of estimated parameters vs the ground truth,
and then overlays the line of identity
as well as a linear fit to the scatter points.
(Ideally, the linear fit would coincide with the line of identity.)

This package uses [RecipesBase.jl](https://github.com/JuliaPlots/RecipesBase.jl),
so [Plots.jl](https://github.com/JuliaPlots/Plots.jl) must be loaded
to actually display a scatter plot.

## Usage

Install this package and Plots.jl with
`] add ParameterEstimateScatterPlots Plots`
in the Julia REPL.

```julia
julia> using Plots, ParameterEstimateScatterPlots

julia> x = LinRange(0, 10, 1000); xhat = x.^1.1 .+ 0.5 .* randn(size(x));

julia> scatterestimates(x, xhat, name = "x", units = "cm")
```

[Example parameter estimate scatter plot](./images/example.png)
