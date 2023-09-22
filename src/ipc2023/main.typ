#import "imports/preamble.typ": *

#set text(size: 25pt, font: "Iosevka")

#set document(title: "Leveraging Nix in the PHP ecosystem", author: "Pol Dellaiera")

#show: ipc-theme.with(
  short-author: "Pol Dellaiera",
  short-title: "IPC2023 - Leveraging Nix in the PHP ecosystem",
  short-date: "2023/10/26",
  ecmain: color-a, // Red from IPC website
  ecaccentblue: rgb(72, 214, 217).darken(25%), // Green from IPC website
  progress-bar: false
)

#pdfpc.config(
	duration-minutes: 60,
	start-time: datetime(hour: 12, minute: 00, second: 00),
	note-font-size: 14
)

#title-slide(
  authors: ("Pol Dellaiera"),
  title: "Leveraging Nix in the PHP ecosystem",
  subtitle: "An innovation-centric approach",
  date: "2023/10/26",
  institution: "International PHP Conference",
  logo: image("../../resources/images/ipc-logo.svg", width: 60mm),
)

#include "intro.typ"

#include "history.typ"

#include "package-manager.typ"

#include "reproducibility.typ"

#include "programming-language.typ"

#include "software-builder.typ"

#include "operating-system.typ"

#include "nix-summary.typ"

#include "demo.typ"

#include "outro.typ"

#include "references.typ"
