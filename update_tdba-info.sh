#!/usr/bin/sh

hugo

aws s3 sync ./public s3://tdba-info


