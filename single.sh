#!/bin/bash
. $PATH/nsdv/main_yt-dlp.sh
. $PATH/nsdv/search_url.sh
function fun_format_list(){
	if [ $var_show -eq 1 ] || [ $var_show -eq 3 ]
	then
		if [ $var_show -eq 1 ]
		then
		type_url=" Video"
		fi
		Format_list="-F"
		echo "Enter${type_url} url"
		read v_url
        fun_search_for_url
		fun_yt_dlp	# main_yt-dlp.sh
    
	elif [ $var_show -eq 2 ] || [ $var_show -eq 5 ]
	then
		Format_list="-F"
		fun_yt_dlp	# main_yt-dlp.sh
fi
}

function fun_format_vid_down(){
	echo "Enter ID of the formatting"
	read format_id
	Format_video="-f $format_id"
	if [ $var_show -eq 1 ] || [ $var_show -eq 5 ]
	#if (test $var_show -eq 1)
	then
		Format_list=""
		fun_output	# output.sh
		fun_yt_dlp	# main_yt-dlp.sh
	fi
}
