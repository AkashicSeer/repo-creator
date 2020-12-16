# repo-creator
***WARNING***
Use this only with new, empty, remote repositories. This will overwrite all
code in that repository. This is strictly for pushing existing code to a 
**NEW REMOTE REPOSITORY"** 

If your local code directory contains a .git directory rm -r remove it before 
using this script. This script creates the local repo for your code calling git init 

This script creates local repositories from existing code and pushes to a remoterepository. It changes to the directory you tell it to
and runs git init, then adds the files, then commits them by asking you for a comment, it then pushes the files to the remote repo you list. 
As it pushes it attempts to set the git upstream origin info so the next time you push it just works.


This ***requires a minimum git version of 2.28+*** or else you get errors due to the -b switch provided to git init

**This script requires that the remote git repository you want to push your local code to exists.**

This script also ***requires you to setup ssh keys*** on your host git server aka github, gitlab, bitbucket each 
is different. 
Here is a great explanation and [good example](https://www.howtogeek.com/424510/how-to-create-and-install-ssh-keys-from-the-linux-shell/) 
of how to create ssh keys.
If you already have keys you can use those, you must install the keys on your host though.

Here is how to do it with [Github](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

Here is how you do it for [Gitlab](https://docs.gitlab.com/12.10/ee/ssh/README.html#adding-an-ssh-key-to-your-gitlab-account)

Here is how to do it for [Bitbucket](https://support.atlassian.com/bitbucket-cloud/docs/set-up-an-ssh-key/)

You can do the same with any host even your own git hosted on a $5 a month cloud.

To use this script clone it to your users home directory such as /home/akashicseer/ or create a folder with it such as
/home/akashicseer/git-bash/

Change into the directory and clone the repo.

Once you have cloned it change the permissions so you can execute it with a command such as

    sudo chmod 755 repo-creator.sh 

Then to execute the script type ./repo-creator.sh

Then answer the questions. 

The directory to your code you want to turn into a repo must be owned by the user you are logged in as.

Give an **absolute path** to the directory you want to be turned into a local repo. It must be a local repo before it can be pushed to another repo.

The repo URI you enter must be SSH it cannot begin with https:// for example
the following is what I entered at the prompt git@github.com:AkashicSeer/repo-creator.git

You can use this scipt however you want. I may update it some time to add new features.
