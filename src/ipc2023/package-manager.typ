#import "imports/preamble.typ": *

#focus-slide[
  #set align(center + horizon)
  #set text(size: 1.5em, fill: white, font: "Virgil 3 YOFF")

  Nix is just#uncover("2-4")[.]#uncover("3-4")[.]#uncover("4-4")[.]

  #uncover("5-")[a *package manager*]

  #pdfpc.speaker-note(```md
    A few slides back, I introduced NixOS; now, let's shift our focus to Nix.
    You might be wondering, where is this all leading?

    Well, our aim is to deepen our understanding of these tools.

    As I just said, Nix is a package manager, at first.
    And NixOS is a Linux distribution built on top of Nix, just like what apt is
    to Debian for example.

    Easy, right? Well, that wraps it up! Thank you all for coming, enjoy your
    lunch!

    Just kidding! There's so much more to delve into. However, during the making
    of this presentation, I had to make some choices.
    Also, covering all the features and nuances would take well over an hour,
    so I hope you won't mind if we take some shortcuts.
  ```)
]

#slide(title: "The package manager", new-section: "Nix")[
  #let cell = box.with()

  #grid(
    columns: (1fr, 2fr),
    cell(height: 100%)[
      #uncover("1,9-", mode: "transparent")[- Portability]
      #uncover("2,9-", mode: "transparent")[- Immutable]
      #uncover("3,9-", mode: "transparent")[- Declarative]
      #uncover("4,9-", mode: "transparent")[- Atomic updates]
      #uncover("5-7,9-", mode: "transparent")[- Package repository]
      #uncover("8,9-", mode: "transparent")[- Easy to contribute]
      #uncover("9,9-", mode: "transparent")[- Reproducibility]
    ],
    cell(height: 100%, width: 100%)[
      #set text(size: 15pt)

      #only("1")[
        #set text(size: .5em)
        #figure(
          image("../../resources/screenshots/Screenshot_20231015_192226.png", height: 90%),
          caption:[
            #link("https://www.reddit.com/r/linux/comments/nt1tm9/i_made_a_uniform_icon_set_of_linux_distribution/")[reddit.com]
          ]
        )
      ]

      #only("2")[
        #set text(size: .5em)
        #figure(
          image("../../resources/screenshots/Screenshot_20231015_193514.png", fit: "contain")
        )
      ]

      #only("3")[
        #set text(size: .5em)
        #figure(
          image("../../resources/images/Untitled-2023-10-14-2343.png", height: 90%),
          caption:[Programming paradigms]
        )
      ]

      #only("4")[
        #figure(
          image("../../resources/images/ds.png", height: 90%)
        )
        #show par: set block(spacing: 0.40em)
        #place(center, dx: -55pt, dy: -301pt)[#text(size: 1.2em, font: "Virgil 3 YOFF", fill: rgb("#000000"))[#rotate(-21deg)[
          Don't

          update
          ]]]
        #place(center, dx: 20pt, dy: -300pt)[#text(size: 1.05em, font: "Virgil 3 YOFF", fill: rgb("#000000"))[#rotate(-21deg)[Update]]]
      ]

      #only("5")[
        #set text(size: .5em)
        #figure(
          image("../../resources/images/map_repo_size_fresh.svg", height: 90%),
          caption:[
            #link("https://repology.org/repositories/graphs")[https://repology.org/repositories/graphs]
          ]
        )
      ]

      #only("6")[
        #set text(size: .5em)
        #figure(
          image("../../resources/images/map_repo_size_fresh.svg", height: 90%),
          caption:[
            #link("https://repology.org/repositories/graphs")[https://repology.org/repositories/graphs]
          ]
        )
        #place(top + right, dx: -2.7cm, dy: .9cm)[
          #rotate(-25deg)[
            #image("../../resources/images/arrow.svg", width: 200pt),
          ]
        ]
        #place(top, dx: 2cm, dy: 3cm)[
          #text(size: 6em, font: "Virgil 3 YOFF", fill: rgb("#000000"))[nix is here!]
        ]
      ]

      #only("7")[
        #set text(size: .5em)
        #figure(
          image("../../resources/screenshots/Screenshot_20231015_191236.png", height: 90%),
          caption:[
            #link("https://repology.org/repository/nix_unstable")[https://repology.org/repository/nix_unstable]
          ]
        )
      ]

      #only("8")[
        #set text(size: .5em)
        #figure(
          image("../../resources/screenshots/23fd43389a1dfeb3.png", height: 90%),
          caption:[
            #link("https://github.com/NixOS/nixpkgs/pulse/monthly")[https://github.com/NixOS/nixpkgs/pulse/monthly]
          ]
        )
      ]

      #only("9")[
        #set align(center)
        #figure(
          image("../../resources/images/essawy-triangle.png", height: 90%),
          caption: [
            Adapted from Essawy et al. 2020 @ESSAWY2020104753
          ]
        )
      ]
    ]
  )

  #pdfpc.speaker-note(```md
    - Nix is portable. It works on every Linux distributions. There is no
    difference in using Nix on your favorite linux distribution than on any
    other.

    - Nix is a package manager, but not like the others. It is immutable, which
    means that once a package is built, it cannot be modified. It is not like
    other package managers where you can install a package, then modify it, then
    install another package that depends on the first one, and so on.

    - In Nix, once a package is built, it cannot be modified. If you want to
    modify it from where it has been installed, you have to rebuild it.
    Nix uses a content-addressed store, which means that every package is
    identified by a hash of its content. This is what makes Nix immutable.
    This is what we can see on this screenshot, we can see that the php
    interpreter is installed in a very specific directory that looks like a hash
    and it's content is not writable by anybody.

    - Unlike the PHP language which is mostly imperative, the package manager
    uses a declarative language, a more functional approach to package
    management.

    - Nix performs upgrades atomically, meaning either all changes are made or
    none are. Additionally, it's easy to roll back to a previous configuration.

    - The package repository of Nix is called `nixpkgs`. It is a huge repository
    of expressions (or recipes), and it is growing every day. It is the biggest
    package repository of any Linux distribution as we can see on this slide.

    - It's also very easy to contribute, here's the activity of the repository
    over the last month. As you can see, it is very active. Later in the
    presentation I'll show you how easy it is to contribute.

    - Nix is trying to be as reproducible as possible. Meaning that when you
    build something with Nix, it put you in the good conditions to be able to
    rebuild it anywhere else and get the same result.
    About reproducibility, I don't know if you're aware of this concept yet, but
    let me explain what it is.
  ```)
]
