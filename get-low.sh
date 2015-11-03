#!/bin/sh

wget -q -O - "http://portal.eon.cz/hdo/www/homepage/result?platnost_id=21&code=A1B6DP6&locality=8" | awk -f parse.awk
