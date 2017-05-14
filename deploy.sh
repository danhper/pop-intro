#!/bin/bash

SLIDES_NAME=${SLIDES_NAME:-$(basename $(dirname $(pwd)))}
BLOG_DIR=${BLOG_DIR:-/tmp/blog}
BLOG_REPO=${BLOG_REPO:-"git@github.com:tuvistavie/blog.git"}

NODE_ENV=production gulp build
git clone $BLOG_REPO $BLOG_DIR
rm -rf $BLOG_DIR/slides/$SLIDES_NAME
cp -r build $BLOG_DIR/slides/$SLIDES_NAME

cd $BLOG_DIR

git add slides/$SLIDES_NAME
git commit -m "Update $SLIDES_NAME"
git push
