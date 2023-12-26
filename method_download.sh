#!/bin/bash

function fun_download(){
fun_method_download    # function method download.
read S_down
func_test_variables_read $S_down
if (test $S_down -eq 1)
then
	fun_URL
elif (test $S_down -eq 2)
then
	fun_URL_File
else
	fun_exit
fi
}


