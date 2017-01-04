FROM sellpy/haskell-stack:latest

ADD sellpy.cabal /app/
WORKDIR /app
RUN stack setup
RUN stack build
