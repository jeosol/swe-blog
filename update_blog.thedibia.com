#!/usr/bin/sh

#hugo -t mainroad-thedibia
#hugo -b "http://www.blog.thedibia.com" --theme=mainroad-thedibia
#hugo --theme=mainroad-thedibia
hugo
aws s3 sync ./public s3://blog.thedibia.com





