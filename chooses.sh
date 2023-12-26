#!/bi/bash

## selection function method download.
function fun_method_download(){
echo "+---+----------------------------------------+"
echo "|   | Methods                                |"
echo "+---+----------------------------------------+"
echo "| 1 | Download from URL                      |"
echo "| 2 | Download from file                     |"
echo "+---+----------------------------------------+"
echo "Choose Method"
}
## selection function show lists.
function fun_show_list {
echo "+---+----------------------------------------+"
echo "|   | Show                                   |"
echo "+---+----------------------------------------+"
echo "| 1 | Show formatting list                   |"
echo "| 2 | Show subtitles list                    |"
echo "| 3 | Download Thumbnails                    |"
echo "| 4 | Show formatting list (playlist)        |"
echo "+---+----------------------------------------+"
echo "| 0 | skip                                   |"
echo "+---+----------------------------------------+"
echo "Choose option"
}

## selection function options downloading URL.
function fun_options_down_from_url(){
echo "+---+----------------------------------------+"
echo "|   | Options                                |"
echo "+---+----------------------------------------+"
echo "| 1 | Enter video formatting                 |"
echo "| 2 | Output location                        |"
echo "| 3 | Playlist download                      |"
echo "+---+----------------------------------------+"
echo "| 8 | Download                               |"
echo "+---+----------------------------------------+"
echo "Choose option"
}

## selection function options downloading from file.
function fun_options_down_from_url_file(){
echo "+---+----------------------------------------+"
echo "|   | Options                                |"
echo "+---+----------------------------------------+"
echo "| 1 | Show formatting list                   |"
echo "| 2 | Enter formatting video                 |"
echo "| 3 | Output location                        |"
echo "+---+----------------------------------------+"
echo "| 8 | Download                               |"
echo "+---+----------------------------------------+"
echo "Choose option"
}

## skip downloading function.
function fun_skip_options(){
echo "+---+----------------------------------------+"
echo "|   | Options                                |"
echo "+---+----------------------------------------+"
echo "| 1 | Skip download the video                |"
echo "| 2 | Continue download the video            |"
echo "+---+----------------------------------------+"
echo "Choose option"
}

