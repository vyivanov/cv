#!/usr/bin/env bash

docker run --rm -it -v "$(pwd)":/opt/markup vyivanov/latex-docker:latest all
