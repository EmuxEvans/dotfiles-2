#!/bin/bash
exclude=('.' '..' '.git' 'README.md' '.gitignore')
instdir="$HOME"

backup="bak"
overwrite=1
dryrun=0
newlink=()
exist=()
curdir=`pwd -P`
# help
HELP="Usage: $0 [-nd] [-b <backup file postfix>] [-e <exclude file>] [-i <install dir>]

Arguments:
      -b  Set backup postfix (default: make *.bak file)
          Set \"\" if backups are not necessary
      -e  Set additional exclude file (default: ${exclude[@]})
      -i  Set install directory (default: $instdir)
      -n  Don't overwrite if file is already exist
      -d  Dry run, don't install anything
      -h  Print Help (this message) and exit
"
while getopts b:e:i:ndh OPT;do
  case $OPT in
    "b" ) backup=$OPTARG ;;
    "e" ) exclude=(${exclude[@]} "$OPTARG") ;;
    "i" ) instdir="$OPTARG" ;;
    "n" ) overwrite=0 ;;
    "d" ) dryrun=1 ;;
    "h" ) echo "$HELP" 1>&2; exit ;;
    * ) echo "$HELP" 1>&2; exit ;;
  esac
done

echo "**********************************************"
echo "Install .X to $instdir"
echo "**********************************************"
echo
if [ $dryrun -ne 1 ];then
  mkdir -p $instdir
else
  echo "*** This is dry run, not install anything ***"
fi
for f in .*;do
  for e in ${exclude[@]};do
    flag=0
    if [ "$f" = "$e" ];then
      flag=1
      break
    fi
  done
  if [ $flag = 1 ];then
    continue
  fi

  install=1
  if [ $dryrun -eq 1 ];then
    install=0
  fi
  if [ "`ls "$instdir/$f" 2>/dev/null`" != "" ];then
    exist=(${exist[@]} "$f")
    if [ $dryrun -eq 1 ];then
      echo -n ""
    elif [ $overwrite -eq 0 ];then
      install=0
    elif [ "$backup" != "" ];then
      mv "$instdir/$f" "$instdir/${f}.$backup"
    else
      rm "$instdir/$f"
    fi
  else
    newlink=(${newlink[@]} "$f")
  fi
  if [ $install -eq 1 ];then
    ln -s "$curdir/$f" "$instdir/$f"
  fi
done
echo ""
if [ $dryrun -eq 1 ];then
  echo "Following files don't exist:"
else
  echo "Following files were newly installed:"
fi
echo "  ${newlink[@]}"
echo
echo -n "Following files existed"
if [ $dryrun -eq 1 ];then
  echo "Following files exist:"
elif [ $overwrite -eq 0 ];then
  echo "Following files exist, remained as is:"
elif [ "$backup" != "" ];then
  echo "Following files existed, backups (*.$backup) were made:"
else
  echo "Following files existed, replaced old one:"
fi
echo "  ${exist[@]}"
echo
