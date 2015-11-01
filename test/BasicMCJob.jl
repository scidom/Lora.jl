using Base.Test
using Lora

# println("    Testing BasicMCJob constructors...")

# Example 1: multivariate parameter

p = ContinuousMultivariateParameter(
  1,
  :p,
  logtarget=(state, states) -> state.logtarget = -dot(state.value, state.value)
)
model = single_parameter_likelihood_model(p)

sampler = MH([1., 1.])

tuner = VanillaMCTuner()

mcrange = BasicMCRange(nsteps=10000, burnin=1000)

vstate = VariableState[ContinuousMultivariateParameterState([1.25, 3.11], [:value, :logtarget])]

outopts = Dict{Symbol, Any}(:monitor=>[:value, :logtarget])

job = BasicMCJob(
  model,
  1,
  sampler,
  tuner,
  mcrange,
  vstate,
  outopts,
  true,
  false
)

@time chain = run(job)

# Example 2: univariate parameter

p = ContinuousUnivariateParameter(
  1,
  :p,
  logtarget=(state, states) -> state.logtarget = -abs2(state.value)
)
model = single_parameter_likelihood_model(p)

sampler = MH()

tuner = VanillaMCTuner()

mcrange = BasicMCRange(nsteps=10000, burnin=1000)

vstate = VariableState[ContinuousUnivariateParameterState(5.1, [:value, :logtarget])]

outopts = Dict{Symbol, Any}(:monitor=>[:value, :logtarget])

job = BasicMCJob(
  model,
  1,
  sampler,
  tuner,
  mcrange,
  vstate,
  outopts,
  true,
  false
)

@time chain = run(job)
