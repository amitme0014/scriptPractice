#!/bin/bash -e

eval $(ssh-agent)
ssh-add bhaiyaKeyPair.pem
START_TIME_DAY=$(date +%d)
START_TIME_HOURS=$(date +%H)
START_TIME_MINUTES=$(date +%M)
START_TIME_SECONDS=$(date +%S)
START_DATE=$(date)

rsync -avzhe ssh --progress /home/ubuntu/source ubuntu@54.201.172.230:/home/ubuntu/destination

END_TIME_DAY=$(date +%d)
END_TIME_HOURS=$(date +%H)
END_TIME_MINUTES=$(date +%M)
END_TIME_SECONDS=$(date +%S)
END_DATE=$(date)

#echo $START_TIME
#echo $END_TIME
#echo "rsync started on ${START_DATE}"
#echo "rsync ended on ${END_DATE}"

DIFF_DAY=$(( $END_TIME_DAY - $START_TIME_DAY ))
DIFF_HOURS=$(( $END_TIME_HOURS - $START_TIME_HOURS ))
DIFF_MIN=$(( $END_TIME_MINUTES - $START_TIME_MINUTES ))
DIFF_SEC=$(( $END_TIME_SECONDS - $START_TIME_SECONDS ))

echo "rsync from bitbucket gxicloud to ocean bitbucket started on ${START_DATE} and ended on ${END_DATE} ,total time elapsed was ${DIFF_DAY} days ${DIFF_HOURS} hours ${DIFF_MIN} minutes ${DIFF_SEC} seconds"
echo "rsync from bitbucket gxicloud to ocean bitbucket started on ${START_DATE} and ended on ${END_DATE} ,total time elapsed was ${DIFF_DAY} days ${DIFF_HOURS} hours ${DIFF_MIN} minutes ${DIFF_SEC} seconds" >> rsync.log
