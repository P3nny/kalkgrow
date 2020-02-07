#! bin/bash

while [ : ]
do
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ffmpeg -f video4linux2 -i /dev/video2 -vframes 1 $TIMESTAMP.jpg
    s3cmd put --acl-public $TIMESTAMP.jpg s3://kalkgrow/plant.jpg
    sleep 12
done
