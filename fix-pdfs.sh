#!/bin/bash

for f in */figures/*.pdf; do
	pdftk $f cat output $f.new && mv $f.new $f
done

