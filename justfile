default:
    @just --list

run:
    stack run

run-opt:
    stack run --ghc-options='-O2'

build:
    stack build

watch:
    stack build --file-watch --exec "my-haskell-webapp-exe"

fmt:
    find app -name "*.hs" | xargs stack exec -- ormolu --mode inplace

docker-build:
    docker build -t my-haskell-webapp:latest .

docker-run:
    docker run --rm -p 3000:3000 my-haskell-webapp:latest