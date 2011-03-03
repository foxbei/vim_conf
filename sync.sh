Dirname=basename $PWD
echo "$Dirname haGithub sync begin ...... "
echo "Begin exec: git add ."
git add . 
echo "Begin exec: git commit -a -m 'commit message'"
echo -n "Please input $Dirname commit message: "
read Msg
Update=`date`
git commit -a -m "$Update $Msg"
echo "Begin exec: git push "
echo "Pushing, please waiting ......"
git push
echo "$Dirname Github sync finished, exit. "
