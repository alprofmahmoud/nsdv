#!/bin/bash

function fun_plst_format_list_from_url(){
		type_url="Playlist"
		echo "Enter playlist video start"
		read S_item
		echo "Enter playlist video end"
		read E_item
		pl_s="--playlist-start"
		pl_e="--playlist-end"
		Format_list="-F"
		echo "Enter $type_url URL"
		read v_url
		fun_yt_dlp	# main command function.
		Format_list=""
		echo "enter ID formatting"
		read format_id
		fun_output
		fun_yt_dlp
}
function fun_plst_format_from_url(){
	type_url="Playlist"
	echo "Hello $type_url"
	echo "Enter playlist video start"
	read S_item
	echo "Enter playlist video end"
	read E_item
	pl_s="--playlist-start"
	pl_e="--playlist-end"
	Format_list=""
}
