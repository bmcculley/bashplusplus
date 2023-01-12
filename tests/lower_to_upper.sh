include [fmt];
include [str];

main() {
  up=$(str.ToUpper "i'm lowercase")
  fmt.Println "${up}";
}
