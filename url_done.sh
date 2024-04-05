#/bin/bash
. $PATH/nsdv/single.sh

function fun_url_nmbr()
{
echo "enter url number in urldone file"
read url_done
if test -f $HOME/urldone;
then
v_url=$(sed -n "$url_done"p $HOME/urldone)
else
    echo "not found in urldone file."
    exit
fi
fun_format_list
fun_format_vid_down
}
