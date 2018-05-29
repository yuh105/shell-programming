#!/bin/sh

# 引数の2つともがファイルの時のみ 1 を出力する
check_file_or_directory() {
	read file1 
	read file2
	
	file1_type=${file1:0:1}
	file2_type=${file2:0:1}	

	# debug
	# echo "- - - - -"
	# echo $file1_type
	# echo $file2_type
	# echo "- - - - -"

	if [ "$file1_type" = '-' -a "$file2_type" = '-' ]; then
		echo '1'
	else
		echo '0' 
	fi
	
	return 0
}

mvs() {
	read num
	case $num in 
		# 0 ) mv "$1" "$2" ;;
		0 ) echo "mv "$1" "$2"" ;;
		1 ) echo "overwrite '$2'? [y/n] " ;;	
	esac
}


case $# in
	2 ) ls -l | grep -w -e "$1" -e "$2" | check_file_or_directory | mvs "$1" "$2" ;;
	* ) echo "usage: mvs [-f | -i | -n] [-v] source target\n       mvs [-f | -i | -n] [-v] source ... directory" ;;
esac

