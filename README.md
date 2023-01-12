# BashPlusPlus

Bash with Class(es)

Initially this spawned from a friend having trouble formatting a string with
color. At first I did a basic `printf` example, next came a little function
that looked something like `fmt.Println`. After viewing their project I
realized just how big of a script it was. It spanned multiple shell script
files, had a number of functions, etc. After looking at it for a few minutes I
thought...that could really use some classes.

Down the rabbit hole I went and emerged maybe more than a few hours later with
this. It doesn't do a whole lot, really. But, it sure is fun to look at. :D

In all seriousness if you really want [object oriented shell scripts](https://blog.fpmurphy.com/2010/05/ksh93-using-types-to-create-object-orientated-scripts.html) have a look at korn shell 93.

## Usage:

Download or clone this repository.

 - git clone 
 - cd bashplusplus
 - Make sure `bpp` is executable `chmod +x bpp`
 - Add `bpp` to the PATH. export PATH=$PATH:$(pwd)/bin
 - Set an environment variable `BPP_CLS_PATH` that points to the classes directory.
 - export BPP_CLS_PATH=$(pwd)

Run an example:
 - cd examples
 - bpp hello.sh

## A brief example

```bash
#hello.sh
include [fmt];

main() {
	fmt.Println "Hello, World";
}
```

```bash
$ bpp hello.sh
Hello, World
```

## Documentation

### Include

In order to use classes they need to be included in the script. It's possible
to include builtin classes and to create and use local classes.

#### Builtin Classes

To include a builtin class the class name should be within square brackets:

```bash
include [fmt];
``` 

#### Local Classes

To include a local class the path and the class should be included within
double quotes:

```bash
include "myclasses/myclass.sh"
```

### Printing

Verbs

%%  a literal percent sign; consumes no value
%s	the uninterpreted bytes of the string

function fmt.Printf

```
fmt.Printf(string, parameters)
```

fmt.Printf formats according to a format specifier and writes to standard output.

**Example**

```bash
include [fmt];

main() {
	name="Sam"
	fmt.Printf "Hello, %s!" name;
}
```

Output:

Hello, Sam!

function fmt.Println

```
fmt.Println(string)
```

fmt.Println accepts a formatted string and writes to standard output.

**Example**

```bash
include [fmt];

main() {
	fmt.Println "Hello, World";
}
```

function fmt.Errorln

```
fmt.Errorln(string)
```

fmt.Errorln accepts a formatted string and writes to standard error.

**Example**

```bash
include [fmt];

main() {
	fmt.Errorln "This is an error"
}
```

### Strings (str)

function str.ToUpper

```bash
str.ToUpper(string) string
```

fmt.ToUpper returns s with all Unicode letters mapped to their upper case. 

**Example**

```bash
include [fmt];
include [str];

main() {
	up=$(str.ToUpper "i'm lowercase")
	fmt.Println "${up}";
}
```

function str.ToLower

```bash
str.ToLower(string) string
```

fmt.ToLower returns s with all Unicode letters mapped to their lower case.

**Example**

```bash
include [fmt];
include [str];

main() {
	low=$(str.ToLower "I'M UPPERCASE");
	fmt.Println "${low}";
}
```

function str.Format

```bash
str.Format(string, parameters)
```

str.Format accepts a string with named formatting parameters and returns it fully formatted.

Parameters:

background
color
	black
	red
	green
	brown
	blue
	purple
	cyan
	gray

effect
	underline
	blink

weight
	normal
	bold

**Example**

```bash
include [fmt];
include [str];

main() {
	fmt.Println "$(str.Format "hello, world" background "black" color "cyan" effect "underline" effect "blink" )"
}
````