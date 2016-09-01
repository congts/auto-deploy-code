#!/bin/bash
# Automatically pull code on --branch
GIT_URL=$(git config --get remote.origin.url)
LOG_FILE="./git_pull.log"
RUNNING="./RUNNING"

usage="$(basename "$0") [-b|--branch] [-h|--help]
where:
    -h|--help  show this help text
    -b|--branch branch_name set the branch name"

while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -b|--branch)
    BRANCH="$2"
    shift # past argument
    ;;
    -h|--help)
    echo "$usage"
    exit
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
        # unknown option
    ;;
esac
shift # past argument or value
done
echo $BRANCH;

if [[ "$BRANCH" == "" ]];then
	echo "--branch is mandatory"
	echo "$usage"
    exit 1
fi


retry=0
while [ -f "$RUNNING" ] && [ "$retry" -lt 2 ]
do
    sleep 3
    ((retry++))
done

if [ $retry -gt 1 ]; then
    echo "Running!" >> $LOG_FILE
    exit
fi
touch $RUNNING

git fetch && git checkout $BRANCH
git pull >> $LOG_FILE

# project logic (clear cache folder, etc)
#rm -rf var/cache
#rm -rf var/session
# end

rm $RUNNING