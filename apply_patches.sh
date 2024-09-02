#!/bin/bash

echo Hard-resetting all submodules...
git submodule foreach git reset --hard > /dev/null
patch_core () {
    CORENAME="$1"
    echo
    echo $CORENAME:
    # skip the core-specific patch if it doesn't exist
    [[ -f patches/"$CORENAME".patch ]] || shift
    for PATCHNAME in "$@"; do
        echo Applying $PATCHNAME.patch...
        git apply --directory=cores/"$CORENAME"_MiSTer patches/"$PATCHNAME".patch
    done
    if [[ -f patches/"$CORENAME".pll.patch ]]; then
        echo Applying $CORENAME.pll.patch...
        git apply --whitespace=nowarn --directory=cores/"$CORENAME"_MiSTer patches/"$CORENAME".pll.patch
    fi 
}

patch_core Atari7800 ascal video_mixer
patch_core Gameboy ascal video_mixer
patch_core GBA ascal video_mixer
patch_core MegaCD ascal video_mixer
patch_core MegaDrive ascal video_mixer
patch_core MSX1 ascal video_mixer
patch_core N64 ascal video_mixer
patch_core NeoGeo ascal video_mixer
patch_core NES ascal video_mixer
patch_core PSX ascal video_mixer
patch_core S32X ascal viedo_mixer
patch_core Saturn ascal video_mixer
patch_core SGB ascal video_mixer
patch_core SMS ascal video_mixer
patch_core SNES ascal video_mixer
patch_core TurboGrafx16 ascal video_mixer
