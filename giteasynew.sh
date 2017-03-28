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

list=$(ls -w 1)

chosefile () {
chosefile1=$(zenity --entry --title "Pick file/folder to ADD" --width 400 --text "Your file/folder is called?" --entry-text=$list)
}

choserepo () {
choserepo1=$(zenity --entry --title "Chose GitHub Repo" --width 400 --text "Your Repo is:" --entry-text=$list)
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

#funkcija 7 GitHub Username
username1 () {
username=`zenity --entry --title="GitHUb Username" --width=200 --height=150 \
  --text="Enter Username"`
}

#funckija 8 GitHub Password
password2 () {
password=`zenity --entry --title="GitHub Password" --width=200 --height=150 \
  --text="Enter Password" --hide-text`
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
	git add $chosefile1
}

#funkcija 8 Git Commit
GitCommit () {
	git commit -m "added $gitadd"
}

#funkcija 9 Git Push
GitPush () {
	git push https://$username:$password@github.com/$username/$choserepo1.git

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
		echo -e $white"	[$okegreen"01"$white]$okegreen  Git Clone 			[$okegreen"10"$white]$okegreen Add Commit Push"
		echo -e $white"	[$okegreen"02"$white]$okegreen  Copy Me 			  [$okegreen"11"$white]$okegreen Com 2"
  		echo -e $white"	[$okegreen"03"$white]$okegreen  Git Status "
  		echo -e $white"	[$okegreen"04"$white]$okegreen  Git Pull "
  		echo -e $white"	[$okegreen"05"$white]$okegreen  Git Add , Commit , Push"
  		echo -e $white"	[$okegreen"06"$white]$okegreen  Pogledaj ovo :D "
   		echo -e $white"	[$okegreen"07"$white]$okegreen  Izadji iz programa "
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
        chosefile
        GitAdd
        GitCommit
        username1
        password2
        choserepo
        GitPush

    	elif test $izaberi == '6'
        	then
        	firefox https://www.paypal.me/Stratimo/5 https://www.facebook.com/stratimo https://www.youtube.com/channel/UCGHr9v-O8ZOsxh-HtJNqQJA

    	elif test $izaberi == '7'
        	then
        	clear
        	izlaz
        	sleep 1
        	clear && exit 0

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