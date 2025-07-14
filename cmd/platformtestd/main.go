package main

import (
	"flag"
	"fmt"

	"github.com/fernandoocampo/platform-test/internal/greetings"
)

var (
	version    string
	commitHash string
	buildDate  string
)

var name = flag.String("name", "", "Name to greet")

func main() {
	fmt.Println("starting application", "version", version, "commit", commitHash, "build", buildDate)
	flag.Parse()
	fmt.Println(greetings.Hello(*name))
}
