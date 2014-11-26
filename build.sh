#!/bin/bash

VER=`cat version | perl -ne 'chomp; print join(".", splice(@{[split/\./,$_]}, 0, -1), map {++$_} pop @{[split/\./,$_]}), "\n";'`

dch -b -v $VER --package nagios-check-bl
echo $VER > version


debuild -i -us -uc -b

cd ..
~/bin/publish-deb-packages.sh
