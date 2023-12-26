#!/bin/bash
. ./chooses.sh
. ./output.sh
. ./single.sh
. ./from_url.sh
. ./url_from_file.sh
. ./quit.sh
. ./method_download.sh
. ./subtitles.sh
. ./thumbnails.sh
. ./playlists.sh
. ./test_variables.sh
. ./main_yt-dlp.sh

## variables.
Format_list=""
Format_video=""
lcte=""
pl_s=""
S_item=""
pl_e=""
E_item=""
ap_f="--no-batch-file"
List_subs=""
write_auto_sub=""
Write_sub=""
Sub_lang=""
lng=""
skp=""
type_url="Video"
var_plst_file=0
conv_thumb=""
ppa_thumb=""
write_thumb=""

fun_show_list
read var_show
func_test_variables_read $var_show
if (test $var_show -eq 1)
then
	fun_format_list
	fun_format_vid_down
elif (test $var_show -eq 2)
then
	fun_subttl_list
	fun_subttl_down
elif (test $var_show -eq 3)
then
fun_thumbnail
elif (test $var_show -eq 4)
then
	fun_plst_format_list_from_url
elif (test $var_show -eq 0)
then
	fun_download
else
	fun_exit
fi
