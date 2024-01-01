#!/bin/bash

function fun_subttl_list(){
	List_subs="--list-subs"
	echo "Enter Video URL"
	read v_url
	fun_yt_dlp	# main command function.

}

function fun_subttl_down(){
	List_subs=""
	Write_sub="--write-sub"
	Sub_lang="--sub-lang"
	Wrire_auto_sub="--write-auto-sub"
	echo "Enter subtitle language"
	read lng
	if (test $var_show -eq 2)
	then
		fun_skip_options	# function skip options.
		read var_skp
		func_test_variables_read $var_skp
		if (test $var_skp -eq 1)then
			skp="--skip-download"
		elif (test $var_skp -eq 2)
		then
		skp=""
		fun_format_list    	# function to show format list to this url video.
		fun_format_vid_down	# download video by format function.
		fi
		
		fun_output			# output function.

		Format_list=""
		fun_yt_dlp	# main command function.
	fi
}


