#!/usr/bin/env bash

name=tesseract
repository_url=https://github.com/borodust/bodge-tesseract-v3


if [[ -z  $1 ]] ; then
   echo "Version is not provided!"
   exit 1;
fi

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

declare -A platforms
platforms=(["linux"]="so" ["osx"]="dylib" ["windows"]="dll")

declare -A archs
archs=(["x86_64"]="x86_64" ["i686"]="x86")

for arch in "${!archs[@]}" ; do
    for platform in "${!platforms[@]}" ; do
        target_dir="$script_dir/${archs[$arch]}/"
        mkdir -p "$target_dir"

        lib="lib$name.${platforms[$platform]}.bodged"
        url="$repository_url/releases/download/$1/$lib-$arch-$platform-$1"
        echo "Downloading $lib from $url to $target_dir/$lib"
        if ! wget -O "$target_dir/$lib" -q "$url" ; then
            echo "$lib download failed"
            exit 1;
        fi
    done
done
