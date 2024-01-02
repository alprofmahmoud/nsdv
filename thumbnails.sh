#!/bin/bash

. $PATH/nsdv/main_yt-dlp.sh

fun_thumbnail(){
	type_url=""
	fun_skip_options    # function skip options. chooses.sh
	read var_skp
 	func_test_variables_read $var_skp
  	if (test $var_skp -eq 1)then
		#Format_video=""
		echo "Enter url"
		read v_url
    	skp="--skip-download"

	    elif (test $var_skp -eq 2)
   then
		skp=""
		fun_format_list
		fun_format_vid_down
	fi
	Format_list=""
	one=1
	conv_thumb="--convert-thumbnails png"
	#ppa_thumb='"--ppa ThumbnailsConvertor:-q:v 1"'
	write_thumb="--write-thumbnail"
	

	fun_output
	fun_yt_dlp
}
