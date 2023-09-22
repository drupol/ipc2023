#import "imports/preamble.typ": *

#focus-slide[
  #set align(center + horizon)
  #set text(size: 1.5em, fill: white, font: "Virgil 3 YOFF")

  Nix is just#uncover("2-4")[.]#uncover("3-4")[.]#uncover("4-4")[.]

  #uncover("5-")[a *software builder*]

  #pdfpc.speaker-note(```md
    Nix is many things as you can see, that's why it is also so confusing for
    newcomers. In just a binary weighting around 3 Megabytes, you also have
    a configuration manager slash deployment system.

    Sadly, there are so many great things to show on this topic but I won't show
    them because I still do not know them very well. I wish I could have showed
    you how to build and run in 20 lines of code, a vm based on QEMU but it will
    be for another time.

    In this part of the presentation, I will show a trivial example, how to
    build the symfony-cli client using Nix. I'm using that example because this
    is the first program I packaged for Nix, the 10th of June 2021.
  ```)
]

#slide(title: "The software builder")[
  #set text(size: .6em)

  #figure(caption: "Nix")[
    #sourcefile(lang: "nix", read("../../resources/sourcecode/symfony-cli.nix"))
  ]

  #pdfpc.speaker-note(```md
    In those 18 lines of Nix, we are building a program from source. Using the
    function `buildGoModule` from Nix.

    This function is a software builder, it takes a set of arguments and in the
    end returns a working program.

    As we can see, this is very straightforward, we are just telling Nix where
    to find the source of the program, we are also providing two hashes. One to
    verify that the downloaded sources hasn't been tampered, and one to verify
    that the Go dependencies required to build the symfony-cli are valid.

    And that's it... We are done, we have a working symfony-cli program.
  ```)
]

#slide(title: "The software builder")[
  #set text(size: .6em)

  #only(1)[
    #set text(size: .5em)
    #figure(
      image("../../resources/screenshots/Screenshot_20231023_153403.png", height: 90%),
      caption:[
        #link("https://github.com/NixOS/nixpkgs/pull/259229")[Github]
      ]
    ) <phpstan-pr>
  ]

  #only(2)[
    #set text(size: .5em)
    #figure(
      image("../../resources/screenshots/Screenshot_20231023_153600.png", height: 90%),
      caption:[
        #link("https://github.com/NixOS/nixpkgs/pull/259229")[Github]
      ]
    ) <phpstan-pr-diff>
  ]

  #pdfpc.speaker-note(```md
    The very cool thing with Nix is that once you submit a program to `nixpkgs`,
    there's a robot scanning the repository each day to find outdated software,
    and when it has found one, it automatically provides a PR on Github.

    Here's an example with an update of PHPStan...

    On this <phpstan-pr>, it shows the pull-request...

    And on the following <phpstan-pr-diff>, it shows the changes, only 2 lines.
  ```)
]
