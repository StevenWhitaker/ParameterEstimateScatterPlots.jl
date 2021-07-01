using ParameterEstimateScatterPlots, Plots, Test

# This test just makes sure scatterestimates doesn't error
function test1()

    x = LinRange(0, 1, 10)
    xhat = x.^1.1
    name = "x"
    units = "cm"
    scatterestimates(x, xhat; name, units)
    return true

end

@testset "ParameterEstimateScatterPlots" begin

    @test test1()

end
