#!/bin/zsh
env="dvp"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
start=$(date +%s)

for arg; do
    
    functionName="$arg-$env"
    zipPath="fileb://$arg/src/Archive.zip"
    printf "${GREEN}DEPLOYING $functionName\n${NC}"

    rm -rf $arg/src/node_modules/aws-sdk

    echo "---ARCHIVING---"
    cd $arg/src
    zip -vr Archive.zip * > /dev/null
    cd ../../

    echo "---UPLOADING---"
    aws lambda update-function-code --function-name $functionName --zip-file $zipPath > /dev/null

    echo "---CLEANING UP---"
    cd $arg/src
    rm Archive.zip
    npm install aws-sdk > /dev/null
    git checkout HEAD -- package.json package-lock.json > /dev/null
    cd ../../
    
done

end=$(date +%s)
runtime=$((end-start))
printf "${BLUE} Elapsed Time: $(($end-$start)) seconds\n"

#aws lambda update-function-code --function-name goSatsEngine-dvp --zip-file Archive.zip
