fmt.Errorln() {
  if [ "$#" -ne 1 ]; then
    fmt.Errorln "Illegal number of parameters. Expected fmt.Errorln \"string\"";
    return 1;
  fi
  printf "%s\n" "$*" >&2;
}

fmt.Println() {
  if [ "$#" -ne 1 ]; then
    fmt.Errorln "Illegal number of parameters. Expected fmt.Println \"string\"";
    return 1;
  fi
  printf "%b\n" "${1}";
}

# currently only implements '%s'
fmt.Printf() {
  local finalStr="";
  one=1;
  local formatStr="${!one}";
  end=${#formatStr};
  argNum=2;
  local i=0
  while [ $i -lt $end ]; do
    if [ "${formatStr:$i:1}" == "%" ] \
        && [ $argNum -le $# ]; then
      case "${formatStr:$i+1:1}" in
        s)
          finalStr+=${!argNum};
          argNum=$(( $argNum + 1 ));
          i=$(( $i + 1 ));
          ;;
        %)
          finalStr+="%";
          i=$(( $i + 1 ));
          ;;
        *)
          local char=${formatStr:$i+1:1};
          fmt.Errorln "fmt.Printf: ${char}: invalid format character";
          exit 1;
          ;;
      esac
    else
      finalStr+="${formatStr:$i:1}"
    fi
    i=$(( $i + 1 ));
  done
  printf "${finalStr}";
}
