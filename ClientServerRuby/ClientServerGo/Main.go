package main
import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	for true {
		reader := bufio.NewReader(os.Stdin)
		fmt.Println("1) Add User")
		fmt.Println("2) Show User")
		fmt.Println("3) Delete User")
		fmt.Println("4) Send User")
		option,_:= reader.ReadString('\n');
		if (strings.Contains(option,"1") && strings.Count()){

		}
		if (strings.Contains(option,"2")){

		}
		if (strings.Contains(option,"3")){

		}
		if (strings.Contains(option,"4")){

		}
		if (strings.Contains(option,"5")){
			os.Exit(1);
		}
	}
}
