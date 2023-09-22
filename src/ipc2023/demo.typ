#import "imports/preamble.typ": *

#focus-slide[
  #set align(center + horizon)
  #set text(fill: white, font: "Virgil 3 YOFF")

  #uncover("1-")[
  #fit-to-height(2em)[Hands-on]
  ]
  #set text(size:.5em)
  #set align(right)
  Please, reproduce this at home!
]

#screencast-slide(
  new-section: "Hands-on",
  title: "Installation",
  url: "https://asciinema.org/a/H0WyHmdazHDxFcK8zFgA6myF0",
  preview: "../../../resources/screenshots/Screenshot_20231019_194440.png",
  caption: "Nix installation on Fedora"
)[
  #pdfpc.speaker-note(```md
    1 min
  ```)
]

#screencast-slide(
  title: "Scripting",
  url: "https://asciinema.org/a/dYo81YRrmRaibuVLERghDLbMk",
  preview: "../../../resources/screenshots/Screenshot_20231015_095404.png",
  caption: [Basic of `nix shell` command with `fastfetch` and `cowsay`]
)[
  #pdfpc.speaker-note(```md
    1 min
  ```)
]

#screencast-slide(
  title: "Scripting",
  url:"https://asciinema.org/a/MfbOmgDcnE1ul8jmQzVbTZ3W3",
  preview: "../../../resources/screenshots/Screenshot_20231015_095947.png",
  caption: [Basic shell script with `nix-shell`, with `fastfetch` and `cowsay`]
)[
  #pdfpc.speaker-note(```md
    1 min 30 sec
  ```)
]

#screencast-slide(
  title: "Scripting",
  url:"https://asciinema.org/a/POcTM0tkNUTswaYHFRevE3DJK",
  preview: "../../../resources/screenshots/Screenshot_20231012_102618.png",
  caption: "Basic shell script to fetch latest PHP versions from php.net"
)[
  #pdfpc.speaker-note(```md
    1 min 20 sec
  ```)
]

#slide(title: "nix-shell #1")[
  #set align(center + horizon)
  #set text(size: .5em)

  #only(1)[
    #v(3em)
    #figure(
      {
        set text(size: 1.5em)
        sourcefile(
          file: "shell.nix",
          lang: "nix",
          read("../../resources/sourcecode/shell.nix")
        )
      },
      caption: [
        Source of `shell.nix`
      ]
    )
  ]

  #only(2)[
    #screencast-slide-body(
      url: "https://asciinema.org/a/PL8cPMX5pdlhTYF0aDyFrfHbh",
      preview: "../../../resources/screenshots/Screenshot_20231013_184400.png",
      caption: "Describing its development environment in a file"
    )
  ]

  #pdfpc.speaker-note(```md
    2 min 15 sec
  ```)
]

#slide(title: "nix-build #1")[
  #set align(center + horizon)
  #set text(size: .5em)

  #only(1)[
    #v(1em)
    #figure(
      {
        set text(size: 1.5em)
        sourcefile(
          file: "docker-composer.nix",
          lang: "nix",
          read("../../resources/sourcecode/docker-composer.nix")
        )
      },
      caption: [
        Source of `docker-composer.nix`
      ]
    )
  ]

  #only(2)[
    #screencast-slide-body(
      url: "https://asciinema.org/a/zHbcrKZWXE7PhdJCu1I8WPsG5",
      preview: "../../../resources/screenshots/Screenshot_20231013_185203.png",
      caption: "Building a Docker image containing Composer"
    )
  ]

  #pdfpc.speaker-note(```md
    2 min
  ```)
]

#screencast-slide(
  title: "Nix flake #1",
  url:"https://asciinema.org/a/FObq9afNFDPRN5Ge9xkn9wWqA",
  preview: "../../../resources/screenshots/Screenshot_20231013_190033.png",
  caption: [Creation of a `flake.nix` file]
)[
  #pdfpc.speaker-note(```md
    2 min 30 sec

    As soon as you commit those single 2 files in your project repository,
    you, your colleagues will be aligned on exactly the same versions of the
    software. Isn't this what we try to fix? Isn't this what we all want?

    No more "But it was working on my machine!"

    The Nix cli is full of useful commands related to those flake files, for
    example, to show what are the available outputs that this flake provides.

    In this particular case, we only have one development shell, but there can
    be many many many different outputs.
  ```)
]

#screencast-slide(
  title: "Direnv #1",
  url:"https://asciinema.org/a/Zf00yVOm9c88P2kYDlxOcsvsq",
  preview: "../../../resources/screenshots/Screenshot_20231019_165947.png",
  caption: "Direnv with a Nix flake"
)[
  #pdfpc.speaker-note(```md
    2 min

    All of this is great, but what if I want to share my stuff with others?
    Just because sharing is one of the core-values of open-source.

    Therefore, would it be possible to share my Nix shells programs with others?
  ```)
]

#slide(title: "loophp/nix-shell")[
  #set text(size: .5em)
  #figure(
    image("../../resources/screenshots/Screenshot_20231026_064256.png", height: 90%),
    caption: [
      #link("https://github.com/loophp/nix-shell")[https://github.com/loophp/nix-shell]
    ]
  )

  #pdfpc.speaker-note(```md
    Yes this is fully possible, see this project that I created. The naming is
    very bad, but basically it's a Nix flake that provides a development shell
    containing the tools a PHP developer needs.

    The cherry on the cake is that it provides an API to infer the proper
    version of PHP to use by looking at the `composer.json` file and spawing
    PHP with the required extensions.
  ```)
]

#screencast-slide(
  title: "Advanced use of loophp/nix-shell",
  url:"https://asciinema.org/a/xoPSyMQMhIukgOrazyal1fR9O",
  preview: "../../../resources/screenshots/Screenshot_20231013_191719.png",
  caption: [Advanced usage with `loophp/nix-shell`]
)[
  #pdfpc.speaker-note(```md
    3 min 30 sec
  ```)
]

#screencast-slide(
  title: "PHP 5.6 and PHPStan",
  url:"https://asciinema.org/a/I12D06cTl9tBXDUBPPGQLZJcb",
  preview: "../../../resources/screenshots/Screenshot_20231023_192806.png",
  caption: [Use PHPStan with different version of PHP]
)[
  #pdfpc.speaker-note(```md
    1 min 30 sec
  ```)
]

#slide(title: "PHP/Composer builder in Nix", new-section: "Projects")[
  #set text(size: .5em)

  #only(1)[
    #figure(
      image("../../resources/screenshots/Screenshot_20231026_065658.png", height: 90%),
      caption: [
        #link("https://github.com/NixOS/nixpkgs/pull/225401")[https://github.com/NixOS/nixpkgs/pull/225401]
      ]
    )
  ]

  #only(2)[
    #figure(
      image("../../resources/screenshots/Screenshot_20231026_070139.png", height: 90%),
      caption: [
        #link("https://github.com/NixOS/nixpkgs/pull/261432")[https://github.com/NixOS/nixpkgs/pull/261432]
      ]
    )
    #place(top + right, dx: 25pt, dy: 155pt)[
      #rotate(-200deg)[
        #image("../../resources/images/arrow.svg", width: 90pt),
      ]
    ]
  ]

  #only(3)[
    #figure(
      {
        set text(size: 1.4em)
        sourcefile(
          file: "shell.nix",
          lang: "nix",
          read("../../resources/sourcecode/drupal.nix")
        )
      },
      caption: [
        Source of `drupal.nix`
      ]
    )
  ]

  #set text(size: 2em)

  #only(4)[
    #screencast-slide-body(
      url: "https://asciinema.org/a/kwWzuPxGeeQChCdw0t6paSEkq",
      preview: "../../../resources/screenshots/Screenshot_20231026_071950.png",
      caption: "Building Drupal with Nix"
    )
  ]

  #pdfpc.speaker-note(```md
    - One of the biggest achievement in Nix, beside being granted the core commiter rights not so long ago, is the PHP/Composer builder.
      Basically, it's a way to build PHP applications with Composer, in a reproducible way.

    - It was possible to do something similar before... but it was a pain. On this screenshot, you can see
      a contributor providing a pull-request to switch to the new PHP/Composer builder.
      Check out the amount of lines removed to understand.

    - I won't go into the details, but have a look on how it would be easy to package Drupal in Nix!
      When you execute this, it will create an entry in the Nix store containing a working Drupal.
      Of course, then you need to setup the webserver and so on, but this is a huge achievement.
      This is paving the way for bundling more reliable and secure PHP applications.

    - 1min screencast
  ```)
]

#slide(title: "loophp/php-src-nix")[
  #set text(size: .5em)
  #figure(
    image("../../resources/screenshots/Screenshot_20231026_065440.png", height: 90%),
    caption: [
      #link("https://github.com/loophp/php-src-nix")[https://github.com/loophp/php-src-nix]
    ]
  )

  #pdfpc.speaker-note(```md
    This project is the last
  ```)
]
