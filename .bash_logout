# .bash_logout

# cleanup .hostForScreen
if [ -f ~/.hostForScreen ];then
  if [ "`ps -u$USER|grep screen`" = "" ];then
    sed -i'' -e "/`hostname`/d" ~/.hostForScreen
  fi
fi
echo "(-_-)/~ bye!"
