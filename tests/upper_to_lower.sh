include [fmt];
include [str];

main() {
  low=$(str.ToLower "I'M UPPERCASE");
  fmt.Println "${low}";
}
