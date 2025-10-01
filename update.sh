#!/bin/bash

# $1 is git tag name (e.g. v0.16.0)
version=${1:1}

find . -name Dockerfile -print0 | xargs -0 sed -i -e "s/VERYL_VERSION=.*/VERYL_VERSION=$version/g"
