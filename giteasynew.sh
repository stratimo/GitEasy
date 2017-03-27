#!/bin/bash

#make your github easier

#informacije
name="GitEasy"
version="1.0"
madeby="Stratimo"

#boje
blue='\e[0;34m'
red='\e[1;31m'
green='\e[1;32m'
lgreen='\033[0;32m'
cyan='\033[0;36m'
yellow='\033[0;33m'
okegreen='\033[92m'
white='\e[1;37m'
BlueF='\e[1;34m' #Biru
RESET="\033[00m" #normal
orange='\e[38;5;166m'

#funkcija 1 exit / izlaz
izlaz () {
	echo -e $red''
	echo "   #     #                     "
	echo "   ##   ##   ##   #####  ######"
	echo "   # # # #  #  #  #    # #     "
	echo "   #  #  # #    # #    # ##### "
	echo "   #     # ###### #    # #     "
	echo "   #     # #    # #    # #     "
	echo "   #     # #    # #####  ######"      
	echo -e $blue''
	echo "			 #####  #   #    "
	echo "			 #    #  # #     "
	echo "			 #####    #      "
	echo "			 #    #   #      "
	echo "			 #    #   #      "
	echo "			 #####    #      "
	echo -e $green''
	echo "			  #####                                            "
	echo "			 #     # ##### #####    ##   ##### # #    #  ####  "
	echo "			 #         #   #    #  #  #    #   # ##  ## #    # "
	echo "			  #####    #   #    # #    #   #   # # ## # #    # "
	echo "			       #   #   #####  ######   #   # #    # #    # "
	echo "			 #     #   #   #   #  #    #   #   # #    # #    # "
	echo "			  #####    #   #    # #    #   #   # #    #  ####  "  
}

djoka=$(ls -w 1)

folder1 () {
folder=$(zenity --entry --title "Pick the File/Folder to Archive" --width 400 --text "Izaberi file za upload" --entry-text=$djoka)
}

folder2 () {
folder3=`zenity --entry --title="Git Repo" --width=300 --height=150 \
--text="Enter Username"`
}

#funkcija 2 Git Clone
GitClone () {
	gitclonefile=$(zenity --entry --title "Git Clone" --text "Your file will be copied here: `pwd`/" --entry-text "Url for clone/download !!!")
}

#funkcija 3 Git Add Select File
gitaddselectfile () {
	selectme=$(zenity --list --title "☣ Select File ☣" --text "\nAvailable Files:" --radiolist --column "Pick" --column "Option" `ls`) > /dev/null 2>&1
}

#funkcija 4 Copy Me
CopyMe () {
	zenity --warning --icon-name=dialog-question --ok-label=Copy --title="Copy Me" --text="You will copy $name to new cloned script!\n Just select the cloned folders name !\n And wait to open new terminal ! \n Next time when you want to use this script\n just go in cloned folder and open $name !" --width 300 --height 200;
}

#test
testme1 () {
username=`zenity --entry --title="Login Username" --width=300 --height=150 \
  --text="Enter Username"`
}

testme2 () {
password=`zenity --entry --title="Login Password" --width=300 --height=150 \
  --text="Enter pass" --hide-text`
}

#funkcija 5 Git Status
GitStatus () {
	git status
}

#funkcija 6 Git Pull
GitPull () {
	git pull
}

#funkcija 7 Git Add
GitAdd () {
	git add $folder
}

#funkcija 8 Git Commit
GitCommit () {
	git commit -m "added $gitadd"
}

#funkcija 9 Git Push
GitPush () {
	git push https://$username:$password@github.com/$username/$folder3.git

}

#funkcija 10 pauza
pause () {
   echo ""
   read -sn 1 -p "Back to main menu !"
}


#funkcija 12 Meni
menu () {
  clear
  resize -s 26 80 > /dev/null
  echo -e $cyan"
################################################################################
|                                                                              |
|                                $green $name $version$cyan                                  |
|                            $green Script by $madeby$cyan                               |
|______________________________________________________________________________|
|                                                                              |
|                    Facebook: www.facebook.com/stratimo                       |
|                                                                              |
|         Youtube: www.youtube.com/channel/UCGHr9v-O8ZOsxh-HtJNqQJA            |
|                                                                              |
|                    Donacije: www.paypal.me/Stratimo/5                        |
|                                                                              |
|                                   [$red OK$cyan ]                                     |
|                                                                              |
################################################################################"
		echo -e $white " "
		echo -e $white"	[$okegreen"01"$white]$okegreen  Git Clone 			[$okegreen"10"$white]$okegreen Com 1"
		echo -e $white"	[$okegreen"02"$white]$okegreen  Copy Me 			  [$okegreen"11"$white]$okegreen Com 2"
  		echo -e $white"	[$okegreen"03"$white]$okegreen  Git Status "
  		echo -e $white"	[$okegreen"04"$white]$okegreen  Git Pull "
  		echo -e $white"	[$okegreen"05"$white]$okegreen  Git Add "
  		echo -e $white"	[$okegreen"06"$white]$okegreen  Git Commit "
  		echo -e $white"	[$okegreen"07"$white]$okegreen  Git Push "
  		echo -e $white"	[$okegreen"08"$white]$okegreen  Pogledaj ovo :D "
   		echo -e $white"	[$okegreen"09"$white]$okegreen  Izadji iz programa "
  		echo -e " "
  		echo -n -e $red"  $madeby@$name: "; tput sgr0 #insert your choice
  		read izaberi

  		if test $izaberi == '1'
  			then
  			GitClone
  			git clone $gitclonefile

  		elif test $izaberi == '2'
   			then
   			CopyMe
   			gitaddselectfile
  			cp $0 $selectme
  			gnome-terminal --working-directory=`pwd`/$selectme -e "bash $0"
  			exit

  		elif test $izaberi == '3'
   			then
   			echo
   			GitStatus
   			echo

  		elif test $izaberi == '4'
   			then
   			GitPull

  		elif test $izaberi == '5'
  			then
  			echo ""
        folder1
  			echo "U tvoj folder su"
  			
  			echo -e $red ""
			echo -e $RESET ""
			GitAdd

  		elif test $izaberi == '6'
  			then
  			echo -e $yellow"do you want to add this file $red$GitAdd"
			GitCommit

  		elif test $izaberi == '7'
  			then
        testme1
        testme2
        folder2
  			GitPush
    	elif test $izaberi == '8'
        	then
        	firefox https://www.paypal.me/Stratimo/5 https://www.facebook.com/stratimo https://www.youtube.com/channel/UCGHr9v-O8ZOsxh-HtJNqQJA

    	elif test $izaberi == '9'
        	then
        	clear
        	izlaz
        	sleep 1
        	clear && exit 0

   		elif test $izaberi == '10'
   			then
   			clonme
   			GitClone


   		else
  			echo -e "  Incorrect Number"
  			fi
  			echo -n -e $blue"Do you wanna back to main menu ?$red (Y)es$blue$green (N)o$blue : "
  			read input
		if [[ $input == "Y" || $input == "y" || $input == "yes" ]]; then
				clear
				menu
  			else
				izlaz
				sleep 1
				clear && exit 0

fi
}

menu