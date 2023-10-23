Resource = Bloco
Local = Provider
File = tipo do provider "" {

}

resource "local_file" "exemplo" {
  filename = "exemplo.txt"
  content = "Fullcycle"
}