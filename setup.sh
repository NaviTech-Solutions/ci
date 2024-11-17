#!/bin/bash

BRANCH_NAME=$1

echo "Setting up environment variables..."

# 設置當前分支變數
echo "BRANCH_NAME=$BRANCH_NAME" >> $GITHUB_ENV
echo "Current branch: $BRANCH_NAME"

# 設置 Repository 名稱
REPO_NAME=$(basename "$PWD" | tr '[:upper:]' '[:lower:]')
echo "ECR_REPOSITORY=$REPO_NAME" >> $GITHUB_ENV

# 根據分支設置標籤前綴
if [[ "$BRANCH_NAME" == "master" ]]; then
  TAG_PREFIX="prd"
elif [[ "$BRANCH_NAME" == "develop" ]]; then
  TAG_PREFIX="dev"
else
  TAG_PREFIX="unknown"
fi
echo "TAG_PREFIX=$TAG_PREFIX" >> $GITHUB_ENV

# 設置映像標籤
IMAGE_TAG="${TAG_PREFIX}-$(date -u +"%Y%m%d-%H%M_UTC8" -d '+8 hours')"
echo "IMAGE_TAG=$IMAGE_TAG" >> $GITHUB_ENV

# 設置 ECR Registry
AWS_REGION=${AWS_REGION:-"ap-east-1"}
ECR_REGISTRY="390402541453.dkr.ecr.${AWS_REGION}.amazonaws.com"
echo "ECR_REGISTRY=$ECR_REGISTRY" >> $GITHUB_ENV

echo "Setup completed."
