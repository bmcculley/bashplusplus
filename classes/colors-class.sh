black="30";
red="31";
green="32";
brown="33";
blue="34";
purple="35";
cyan="36";
lightGray="37";

norm="\033[0m";

colors.Format() {
	local color=${2};
	echo $(printf "\033[0;${!color};1;43;4m%s${norm}" "${1}");
}