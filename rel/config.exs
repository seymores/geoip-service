use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: :prod

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"/c9y%M/,LS;&l`IqvkBqQqm2g`{0H!ZicM)%D0Hiicx{E:IfdouQHL5VfYUwn75F"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"&0Ik`EzWHq7Of_Vm!`W<Fb0;C4<|ss5P.[}l&pH5B`rTbDAv[AMDn^1pb{}j9e}t"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :geoip do
  set version: current_version(:geoip)
end

