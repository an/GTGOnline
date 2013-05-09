find . -name '*.pyc' -print0 | xargs -0 rm -f
cp ./GTGOnline/settings_for_openshift.py ./GTGOnline/settings.py
cd ..

newline="\n"
git status
echo -e "$newline$newline"
read -p ">>> Enter git commands: " command

while true
do
    if [ "$command" = "done" ] || [ "$command" = "Done" ] || [ "$command" = "DONE" ]; then
        break
    fi

    if [ "$command" = "exit" ] || [ "$command" = "Exit" ] || [ "$command" = "EXIT" ]; then
        exit
    fi

    $command
    echo -e "$newline"
    read -p ">>> Enter git commands: " command
done
echo -e "$newline"

read -p ">>> Enter commit message: " commit_msg
git commit -am "$commit_msg"
echo -e "Ready to launch!$newline"
git push

cd ./wsgi/

echo -e "Pushed to Openshift$newline Now, lets launch it to GitHub!$newline"

git status
echo -e "$newline$newline"
read -p ">>> Enter git commands: " command

while true
do
    if [ "$command" = "done" ] || [ "$command" = "Done" ] || [ "$command" = "DONE" ]; then
        break
    fi

    if [ "$command" = "exit" ] || [ "$command" = "Exit" ] || [ "$command" = "EXIT" ]; then
        exit
    fi

    $command
    echo -e "$newline"
    read -p ">>> Enter git commands: " command
done
echo -e "$newline"

read -p ">>> Enter commit message: " commit_msg2
if [ "$commit_msg2" = "" ]; then
    echo -e "Using same commit message as OpenShift"
    git commit -am "$commit_msg"
else
    echo -e "Using a new commit message"
    git commit -am "$commit_msg2"
fi
echo -e "Ready to launch!$newline"
git push

echo -e "Pushed to Github$newline Now, lets launch it to Launchpad!$newline"

bzr add 
read -p ">>> Enter commit message: " commit_msg2
if [ "$commit_msg2" = "" ]; then
    echo -e "Using same commit message as OpenShift"
    bzr commit -m "$commit_msg"
else
    echo -e "Using a new commit message"
    bzr commit -m "$commit_msg2"
fi
echo -e "Ready to launch!$newline"
bzr push

cp ./GTGOnline/settings_for_localhost.py ./GTGOnline/settings.py
echo -e "\nDone !\n"
