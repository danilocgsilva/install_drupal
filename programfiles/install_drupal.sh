#!/bin/bash

base_url=https://ftp.drupal.org/files/projects/drupal-
# Check if parameter was provided
if [ -z $1 ]; then
	version=8.2.5
else
	version=$1
fi

url_to_download=$base_url$version.tar.gz
downloaded_file_name=drupal-$version.tar.gz

wget $url_to_download
tar xvzf $downloaded_file_name
