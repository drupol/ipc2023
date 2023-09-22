#import "imports/preamble.typ": *

#focus-slide[
  #set align(center + horizon)
  #set text(size: 1.5em, fill: white, font: "Virgil 3 YOFF")

  Brief history

  #pdfpc.speaker-note(```md
    I haven't explained yet what Nix is, but this will come, no worries... Let's
    start with a brief history
  ```)
]

#slide(title: "Nix", new-section: "History",)[
  #let cell = box.with()

  #grid(
    columns: (2fr, 3fr),
    cell(height: 100%)[
      #uncover("1,4-", mode: "transparent")[- 2003: First commit]
      #uncover("2,4-", mode: "transparent")[- 2006: Doctoral thesis]
      #uncover("3,4-", mode: "transparent")[- 2006: NixOS #box(baseline: 4pt)[#image("../../resources/images/Nix_snowflake.svg", height: 1em)]]
    ],
    cell(height: 100%, width: 100%)[
      #only("1")[
        #set text(size: .5em)
        #figure(
          box(inset: (top: 5pt, x: 5pt), fill: black)[#image("../../resources/screenshots/Screenshot_20231021_170656.png", fit: "contain")],
          caption:[First commit of the Nix project @NixFirstCommit]
        )
      ]

      #only("2")[
        #set text(size: .5em)
        #figure(
          box(inset: (top: 2pt, x: 2pt), fill: black)[#image("../../resources/screenshots/Screenshot_20231021_171758.png", height: 90%, fit: "contain")],
          caption:[Eelco Dolstra's PHD thesis @Dolstra06]
        )
      ]

      #only("3")[
        #set text(size: .5em)
        #figure(
          box(inset: (top: 2pt, x: 2pt), fill: black)[#image("../../resources/screenshots/Screenshot_20231022_120449.png", height: 90%, fit: "contain")],
          caption:[Armijn Hemel's master thesis @INF-SCR-2005-091]
        )
      ]

      #only("4")[
        #figure(
          image("../../resources/sourcecode/nixos-stats/nixos-stats.svg", height: 100%, fit: "contain")
        )
      ]
    ]
  )

  #pdfpc.speaker-note(```md
    In 2003, the journey of Nix began, you can see here the first commit.
    ... leading to its official launch in 2006.

    The brain behind Nix is Eelco Dolstra, who developed it as part of his PhD
    work at the University of Utrecht in the Netherlands. And let's give credit
    where it's due - although Nix has grown to receive global contributions -
    it originated right here in Europe!

    The same year, Armijn Hemel wrote a master thesis on building a Linux
    distribution managed by Nix... and he built the first NixOS linux
    distribution, which is the Linux distribution built on top of Nix, this is
    the distribution that I use since 3 years now.

    And here we are, roughly 20 years later, with a thriving community and a
    growing ecosystem, as you can see on this chart.

    The chart was made from statistics extracted from the git repository.
  ```)
]
