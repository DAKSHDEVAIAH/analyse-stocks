#!/bin/bash
input="onlyaas.sh"
#input="onlystocks.sh"
#echo "Budget : $1";
while IFS= read -r line
do
	curl -s https://www.zacks.com/stock/quote/$line?q=$line >$line.html
	#ls -l $line.html
	grep rank_chip $line.html >/dev/null
	#  Check if the file contains the line "rank_chip
	# if this contains the line, it means the rating is there.
	# Do not process the file without rankings !!!!!
	if [ $? -eq 0 ]
	then 
		perl rankstocks.pl $line.html 5
	else
		#echo "No ranking Removing file $line.html"
		rm $line.html
	fi
	

done < "$input"
