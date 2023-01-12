# foreground colors
black="30";
red="31";
green="32";
brown="33";
blue="34";
purple="35";
cyan="36";
gray="37";


# background colors
bgblack="40";
bgred="41";
bggreen="42";
bgbrown="43";
bgblue="44";
bgpurple="45";
bgcyan="46";
bggray="47";


normal="0"
bold="1";
underline="4";
blink="5";


norm="\033[0m";


str.ToLower() {
  echo $(echo "${1}" | awk '{print tolower($0)}');
}

str.ToUpper() {
  echo $(echo "${1}" | awk '{print toupper($0)}');
}

str.Format() {
  local formatStr=${1};

  local background="";
  local color="";
  local weight="normal";
  local effect="";

  while [[ ${1} ]]; do
    case "${1}" in
      background)
        background="bg"${2};
        shift;
        ;;
      color)
        color=${2};
        shift;
        ;;
      effect)
        tmpEffect=${2};
        if [ "${effect}" != "" ]; then
          effect+=";${!tmpEffect}";
        else
          effect="${!tmpEffect}";
        fi
        shift;
        ;;
      weight)
        weight=${2};
        shift;
        ;;
      *)
        shift;
        ;;
    esac
  done
  fstr="\033[${!weight}";
  if [ "${color}" != "" ]; then
    fstr+=";${!color}";
  fi

  if [ "${effect}" != "" ]; then
    fstr+=";${effect}";
  fi
  
  if [ "${background}" != "" ]; then
    fstr+=";${!background}";
  fi
  fstr+="m%s${norm}";
  echo $(printf "${fstr}" "${formatStr}");
}