#!/bin/bash
find . -name Dockerfile -print0 | xargs -0 sed -i -e "s/VERYL_VERSION=.*/VERYL_VERSION=$1/g"
