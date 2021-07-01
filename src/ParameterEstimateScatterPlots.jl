module ParameterEstimateScatterPlots

using RecipesBase

@recipe function scatterestimatesrecipe(
    ::Type{Val{:scatterestimates}},
    truth,
    estimates,
    z;
    name = "",
    units = ""
)

    legend := :topleft

    # Scatter plot
    @series begin
        seriestype := :scatter
        markercolor := :yellow
        markeralpha := 0.7
        markersize := 5
        markerstrokewidth := 1
        label := ""
        xguide := "True $name" * (units == "" ? "" : " ($units)")
        yguide := "Estimated $name" * (units == "" ? "" : " ($units)")
        x := truth
        y := estimates
    end

    # Line of identity
    @series begin
        seriestype := :straightline
        linecolor := :black
        linewidth := 2
        label := "Ideal"
        x := [0, 1]
        y := [0, 1]
    end

    # Trend line
    (m, b) = [truth ones(eltype(truth), length(truth))] \ estimates
    @series begin
        seriestype := :straightline
        linecolor := :blue
        linewidth := 4
        label := "Trend"
        x := [0, 1]
        y := [b, m + b]
    end

end

export scatterestimates
scatterestimates(args...; kwargs...) = RecipesBase.plot(args...; kwargs..., seriestype = :scatterestimates)

end
