#import "imports/preamble.typ": *

#focus-slide[
  #set align(center + horizon)
  #set text(size: 1.5em, fill: white, font: "Virgil 3 YOFF")

  Nix is just#uncover("2-4")[.]#uncover("3-4")[.]#uncover("4-4")[.]

  #uncover("5-")[a configuration management system]

  #pdfpc.speaker-note(```md
    Nix could also be used as a system orchestrator, it is the one that build
    the system and deploy it, locally or remotely. Just like tools like Ansible,
    Puppet, Chef would do, but with a totally different approach and fixing
    the technical limitations of those tools along the way.

    As I said already earlier, NixOS is the Linux distribution built around the
    Nix tool.

    Let's summarize the key features...
  ```)
]

#slide(title: "The operating system", new-section: "NixOS")[
  #let cell = box.with()

  #grid(
    columns: (2fr, 3fr),
    cell(height: 100%)[
      #uncover("1,4-", mode: "transparent")[- Linux distribution]
      #uncover("2,4-", mode: "transparent")[- Rolling or point release]
      #uncover("3,4-", mode: "transparent")[- Binary packages]
      #uncover("4,4-", mode: "transparent")[- Unique repository]
    ],
    cell(height: 100%, width: 100%)[
      #set text(size: 15pt)

      #only("1")[
        #set text(size: .5em)
        #figure(
          image("../../resources/images/Tux.svg", height: 90%, fit: "contain"),
          caption:[
            #link("https://commons.wikimedia.org/wiki/File:Tux.svg")[Tux]
          ]
        )
      ]

      #only("4")[
        #set text(size: .5em)
        #figure(
          image("../../resources/screenshots/Screenshot_20231026_062532.png", height: 90%, fit: "contain"),
          caption:[
            #link("https://github.com/drupol/nixos-x260")[https://github.com/drupol/nixos-x260]
          ]
        )
      ]
    ]
  )

  #pdfpc.speaker-note(```md
    - NixOS is a Linux distribution just like any other existing Linux
    distribution.

    - The release model is flexible since you can either choose to use it as a
    rolling release or as a point release, you can even switch from one to
    another without breaking your system. Since Nix is doing atomic upgrades,
    breaking your system would be a very hard task to achieve.

    - Binary packages are available for most of the packages, so you don't have
    to compile everything from source. But you can also choose to not use any
    binary package... and you have basically... a Gentoo but on steroids!

    - Nix and NixOS sources are in the same repository, it's very easy to
    contribute to both projects, as I showed you before.
  ```)
]
