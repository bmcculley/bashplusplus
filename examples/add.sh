include [fmt];
include "math.sh";

main() {
  num=$(math.add 2 2)
  fmt.Printf "%s\n" ${num};
}
