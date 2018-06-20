FROM elixir:latest
RUN mix local.hex --force
RUN mkdir /library
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

RUN mix local.rebar --force

WORKDIR /library