#!/usr/bin/env bash


# Written by Alexander Bazhenov December, 2018. Updated December, 2021.

# WARNING! Running this script may cause a potential data loss in your backup
# pools. All actions are at your own risk, otherwise you know what you're doing.

# This Source Code Form is subject to the terms of the BSD 3-Clause License.
# If a copy of the source(s) distributed with this file, You can obtain one at:
# https://github.com/alexanderbazhenoff/data-scripts/blob/master/LICENSE


POOL_NAME="Full"
VOLUMES=$(mysql -u root -B -e'select VolumeName from Media order by VolumeName;' bareos | tail -n+2 | grep $POOL_NAME)

echo "This will delete all volumes in ${POOL_NAME}. Sleep 10 for sure."
sleep 10

for VOL_ITEM in $VOLUMES
do
  echo "delete volume=${VOL_ITEM} yes" | bconsole
done
