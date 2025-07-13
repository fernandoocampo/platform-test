package main

import (
	"flag"
	"fmt"

	"github.com/fernandoocampo/platform-test/internal/greetings"
)

var name = flag.String("name", "", "Name to greet")

func main() {
	flag.Parse()
	fmt.Println(greetings.Hello(*name))
}
