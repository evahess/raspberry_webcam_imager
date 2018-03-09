#!/bin/bash
# This script saves a photo to disk using a logitech c270
#
# March 2018 - Eva Hess <eva@evahess.com>
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin"


function die() {
    echo -e "ERROR: $1" > /dev/stderr
    exit 1
}


BASEDIR="/home/pi/webcam/images"
RESOLUTION="800x600"


# Get Date values
YEAR="$(  date +'%Y' )"
MONTH="$( date +'%m' )"


# Define destination directory for the image
DESTDIR="${BASEDIR}/${YEAR}/${MONTH}"

# Test if dest exists, else create
if [ ! -d "${DESTDIR}" ] ; then
    mkdir -p "${DESTDIR}" || die "Can't create $DESTDIR"
fi


# Find fswebcam binary
FSWEBCAM="$( which fswebcam )"

# Test if fswebcam can be executed
if [ ! -x "${FSWEBCAM}" ] ; then
   die "fswebcam cannot be found! Please install it first using \"apt install fswebcam\""
fi


# Define image name
IMAGE="${DESTDIR}/photo_$( date +'%H%M%S' ).jpg"

# Create a foto using the webcam
FS_OUTPUT="$( fswebcam -r "${RESOLUTION}" --no-banner "${IMAGE}" 2>&1 )"

# Test if creation succeeded
if [ "$?" != 0 ]; then
    die "Failed to save a webcam image to ${IMAGE}\nError was:\n\n$FS_OUTPUT\n"
fi

exit 0

