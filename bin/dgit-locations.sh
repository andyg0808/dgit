#The name of the configuration file that will be searched
confname="newstools.conf"

#Determines the location of the config file and returns its contents.
#Expects $SOURCE to be set, which is the directory in which the script files are
#installed
conffolder()
{
	#Check if the config file is in the current directory
	if [ -e "./$confname" ]
	then
		cat "./$confname"
	
	#Check if the config file is in the user's home directory
	elif  [ -e ~/"$confname" ]
	then
		cat ~/"$confname"
	
	#Check if the config file is in the directory where this script was
	#symlinked from
	elif [ -e "$(dirname $0)/$confname" ]
	then
		cat "$(dirname $0)/$confname"
	
	
	#Check if the config file is in the script files directory
	elif [ -e "$SOURCE/$confname" ]
	then
		cat "$SOURCE/$confname"
	
	#Check if the config file is in the /usr/local/etc directory
	elif [ -e "/usr/local/etc/$confname" ]
	then
		cat "/usr/local/etc/$confname"
	
	#Check if the config file is in the /usr/local/etc/dgit directory
	elif [ -e "/usr/local/etc/dgit/$confname" ]
	then
		cat "/usr/local/etc/dgit/$confname"
		
	#Check if the config file is in the /etc directory
	elif [ -e "/etc/$confname" ]
	then
		cat "/etc/$confname"
		
	#Check if the config file is in the /etc/dgit directory
	elif [ -e "/etc/dgit/$confname" ]
	then
		cat "/etc/dgit/$confname"
		

	else
		#Die with an error
		exit 50
	fi
	
}
