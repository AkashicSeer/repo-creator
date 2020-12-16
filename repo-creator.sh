echo "This script will initialize a repo then push it to a remote repo"
go_again()
{
        echo "########Restarting program########"
        ./repo-creator.sh
}
#pipes y for yes to ssh command to store the url origin whatevernsuch
# sshOutput = y | ssh -T git@github.com
# echo "SSH output $sshOutput"

#get the absolute path to the directory the user wants to turn into a repo
read -p "Enter local dir to turn into git repository ->" gitDir
#get the uri of the repository this needs to exist already
read -p "Enter your repository URI ->" gitRepo
read -p "Enter repository branch name main/master etc ->" repoBranch
#confirm the users choices.
echo "If you answer n for no to the next question, the script exits and nothing happens, nothing is created or pushed!"
read -p "Would you like to initialize a repo in $gitDir and push to $gitRepo ?[y/n] ->" lastCheck
if [ "$lastCheck" = "y" ] || [ "$lastCheck" = "Y" ] 
  then
	echo "Ok completing tasks"
	cd "$gitDir"
	#below is how to echo a directories contents
	#echo $(ls -al)
	#initialize this directory
	echo "XXXXXinitializing repo in $gitDir XXXXX"
	git init -b "$repoBranch"
	#add the files
	git add .
	read -p "Add a commit comment ->" cc
	if [ "$cc" != "" ]
	then
		echo "Message is $cc"
		git commit -m "$cc"
	else

	git commit -m "First commit"
	fi

	git remote add origin "$gitRepo"
	echo "Pushing to remote repo -->$gitRepo"
	git push -u -f origin "$repoBranch"
else
       if [ "$lastCheck" = "n" ] || [ "$lastCheck" = "N" ]
       then 
        echo "Ok looks like you don't want to finish the operation."
       fi
fi

read -p "Would you like to go again? [y/n]?->" goAgain

if [ "$goAgain" == "y" ] || [ "$goAgain" == "Y" ]
then
	echo "We'll go again then..."
	go_again
fi


