### MCSamplerState represents the Monte Carlo samplers' internal state ("local variables")

abstract MCSamplerState

### Abstract Monte Carlo sampler typesystem

## Root Monte Carlo sampler

abstract MCSampler

## Family of samplers based on Metropolis-Hastings

abstract MHSampler <: MCSampler

## Family of Hamiltonian Monte Carlo samplers

abstract HMCSampler <: MCSampler

## Family of Langevin Monte Carlo samplers

abstract LMCSampler <: MCSampler

tuner_state(sampler::MCSampler, tuner::VanillaMCTuner) = VanillaMCTune()

tuner_state(sampler::MHSampler, tuner::AcceptanceRateMCTuner) = AcceptanceRateMCTune()
tuner_state(sampler::LMCSampler, tuner::AcceptanceRateMCTuner) = AcceptanceRateMCTune(sampler.driftstep)
