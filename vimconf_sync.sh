echo "Vim_conf Github sync begin ...... "
echo "Begin exec: git add ."
git add . 
echo "Begin exec: git commit -a -m 'commit message'"
echo -n "Please input commit message: "
read Msg
Update='date'
git commit -a -m $Update+$Msg
echo "Begin exec: git push "
echo "Pushing, please waiting ......"
git push
echo "Vim_conf Github sync finished, exit. "
