#!/bin/bash

function fun_URL(){
for ((counter=1; counter<=4; counter++)); do
fun_options_down_from_url
read options_u
func_test_variables_read $options_u

if (test $options_u -eq 1 )
then
	fun_format_vid_down

elif (test $options_u -eq 2)
then
	fun_output

elif (test $options_u -eq 3)
then
	fun_plst_format_from_url
elif (test $options_u -eq 8)
then
break
else 
	fun_exit
fi

		done
echo "Enter $type_url URL"
read v_url

fun_yt_dlp
}
