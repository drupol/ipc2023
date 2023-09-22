#import "imports/preamble.typ": *


#focus-slide[
  #set align(center + horizon)
  #set text(size: 1.5em, fill: white, font: "Virgil 3 YOFF")

  Nix is just#uncover("2-4")[.]#uncover("3-4")[.]#uncover("4-4")[.]

  #uncover("5-")[a *programming language*]

  #pdfpc.speaker-note(```md
    Nix is also ... a PROGRAMMIG LANGUAGE! I hope you guessed it right ?
  ```)
]

#slide(title: "The programming language")[
  #let cell = box.with()

  #grid(columns: (1fr, 2fr), cell(height: 100%)[
    #line-by-line[
      #uncover("1,4-", mode: "transparent")[- Dynamic]
      #uncover("2-3,4-", mode: "transparent")[- Functional]
      #uncover("4,4-", mode: "transparent")[- Lazy]
    ]
  ], cell(height: 100%)[
    #only("1")[
      #set text(size: 18pt)
      #figure(caption: "Nix")[
        #sourcefile(lang: "nix", read("../../resources/sourcecode/simple-syntax.nix"))
      ]
      #figure(caption: "PHP")[
        #sourcefile(lang: "php", read("../../resources/sourcecode/simple-syntax.php"))
      ]
    ]

    #only("2")[
      #set text(size: 16pt)
      #figure(caption: "Nix")[
        #sourcefile(lang: "nix", read("../../resources/sourcecode/functional.nix"))
      ]
      #figure(caption: "PHP")[
        #sourcefile(lang: "php", read("../../resources/sourcecode/functional.php"))
      ]
    ]

    #only("3")[
      #set text(size: .4em)
      #figure(
        image("../../resources/images/PXL_20231025_144242359.jpg", height: 90%),
        caption: [
          #link("https://phpconference.com/php-core-coding/phel-language-a-native-lisp-for-php/")[https://phpconference.com/php-core-coding/phel-language-a-native-lisp-for-php/]
        ]
      )
    ]

    #only("4")[
      #set text(size: 18pt)
      #figure(caption: "Nix")[
        #sourcefile(lang: "nix", read("../../resources/sourcecode/lazy-evaluation.nix"))
      ]
      #figure(caption: "PHP")[
        #sourcefile(lang: "php", read("../../resources/sourcecode/lazy-evaluation.php"))
      ]
    ]
  ])

  #pdfpc.speaker-note(```md
    Nix is also a programming language. It is extremelly simple and dynamic.
    Warning, I didn't say it is easy, I just said it is simple. This is
    different. There's a very good video about that from Rich Hickey, you'll
    find it in the links.

    On the right here, you can see how to write a function in Nix and its
    counterpart in PHP. There's not typing in Nix, it's a dynamic language.

    Nix is functional, it means that everything is a function or at least, most
    of the things. For PHP developers, having a more functional approach is
    thinking in terms of transformations... but also using functions like
    array_map, array_filter, array_reduce.

    Here's another example with Nix, how to write an array_reduce priting Hello
    World from an array of characters. Pretty simple, right ?

    Nix is Lazy, it means that it will only evaluate expressions when they are
    needed.
    In the example here, I define a variable "a" which is going to throw an
    exception when it will be used. As you can see, this is not an issue for
    Nix. However, for PHP, it instantely throw. PHP is not lazy.

    There's so many things to say about Nix as a programming language, but I
    think it's enough for now. If you want to know more, I invite you to check
    the links at the end of the presentation.
  ```)
]

#slide(title: "Documentation")[
  #set align(center + horizon)
  #set text(size: .5em)

  #v(3em)
  #side-by-side[
    #figure(
      image("../../resources/images/browser.png"),
      caption: [Nix pills @NixPills]
    )
  ][
    #figure(
      image("../../resources/images/browser.png"),
      caption: [Nix dev @NixDev]
    )
  ][
    #figure(
      image("../../resources/images/browser.png"),
      caption: [zero-to-nix.com @ZeroToNix]
    )
  ]
]
