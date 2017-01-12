#!/bin/bash

# Check if system have some utility do make download
if [ `which curl 2> /dev/null` ]; then
	do_download(){
		curl "$url_to_download" -o "$downloaded_file_name"
	}
elif [ `which wget 2> /dev/null` ]; then
	do_download(){
		wget $url_to_download
	}
else
	echo There\'s either curl or wget installed in the system. Can\'t download.
	exit
fi

# If have, so continues
base_url=https://ftp.drupal.org/files/projects/drupal-
# Check if parameter was provided
if [ -z $1 ]; then
	version=8.2.5
else
	version=$1
fi

url_to_download=$base_url$version.tar.gz
downloaded_file_name=drupal-$version.tar.gz

#wget $url_to_download
#curl "$url_to_download" -o "$downloaded_file_name"
do_download

tar xvzf $downloaded_file_name
rm $downloaded_file_name
