include [fmt];
include [str];

main() {
  fmt.Println "Hello, World";
  other
}

print() {
  fmt.Println "${1}";
}

other() {

  print "this works?";

  up=$(str.ToUpper "i'm lowercase")
  fmt.Println "${up}";

  low=$(str.ToLower "I'M UPPERCASE");
  fmt.Println "${low}";

  fmt.Println "$(str.ToLower "ANOTHER EXAMPLE") with OTHER WORDS!";

  fmt.Printf "Hello, %s\n" "World";

  fmt.Printf "I am %s and you can't %s that.\n" "Bash with Class" "teach";

  fmt.Printf "I am %s years old and you can't %s that.\n" "10" "teach";

  fmt.Errorln "This is an error"

  # should produce an error
  #fmt.Errorln "hello, %s" "World";

  # should produce an error
  fmt.Println "hello, %s" "World";

  fmt.Println "My, my"
}
