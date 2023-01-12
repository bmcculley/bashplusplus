include [fmt];
include [str];

main() {
  fmt.Println "$(str.Format "hello, world" background "black" color "cyan" effect "underline" effect "blink" )"
}
