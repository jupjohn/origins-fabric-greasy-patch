#!/bin/sh

# instead of screwing around with the build system, i've made use of publishing apoli to the local maven repo
# which is a fallback when it can't be found on jitpack (upstream source). shitty problems require shitty solutions

# build & publish custom apoli source
cd ./apoli
./gradlew
./gradlew publishToMavenLocal

# build origins mod with custom apoli lib
cd ..
./gradlew
./gradlew remapJar

# i'll send the jar in discord, but dumping the sha256 hash in the pipeline means people can verify it
sha256sum build/libs/Origins-1.20.1-1.10.0.jar
