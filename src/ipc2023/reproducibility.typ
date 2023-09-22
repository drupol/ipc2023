#import "imports/preamble.typ": *

#focus-slide[
  #set align(center + horizon)
  #text(font: "Virgil 3 YOFF")[A few words about reproducibility]
]

#focus-slide[
  #set align(left + horizon)
  #set text(fill: white, size: .6em)
  #set par(justify: true)

    A software is reproducible if given the same source code, build environment
    and build instructions, any party can recreate bit-by-bit identical copies
    of all specified artifacts.

    -- reproducible-builds.org @ReproducibleBuilds

  #pdfpc.speaker-note(```md
    Let's start with a formal definition of reproducibility.

    Of course, we are here to talk about Nix and PHP, how about checking if
    the PHP package manager "Composer" is able to make reproducible builds of
    a PHP application?

    Let's try with the first demo... And in order to avoid bad surprises, I
    recorded each demos in advance, hope you don't mind it!

    How about checking if Composer version 2.6.3 is able to make reproducible
    builds of a PHP application?
  ```)
]

#screencast-slide(
  title: "Reproducibility",
  url: "https://asciinema.org/a/wCNKjF8Rj4lvn1NdXN5UTc1rb",
  preview: "../../../resources/screenshots/Screenshot_20231014_211453.png",
  caption: "Is Composer 2.6.3 reproducible?"
)[
  #pdfpc.speaker-note(```md
    <play the video>

    As we can see in this video, the answer is no, Composer 2.6.3 is not
    reproducible. The content of the `vendor` directory changes at each run.
    There is absolutely no way to tell which one is valid since they are all
    the time different.

    Let's retry the experiment with Composer 2.6.4.
  ```)
]

#screencast-slide(
  title: "Reproducibility",
  url: "https://asciinema.org/a/9mjyTWPenRzkFq0qP4zn12ifx",
  preview: "../../../resources/screenshots/Screenshot_20231014_211453.png",
  caption: "Is Composer 2.6.4 reproducible?"
)[
  #pdfpc.speaker-note(```md
    In this demo, we see that the `vendor` directory produced by Composer is
    reproducable. The content of the `vendor` directory is the same at each
    run. It means that the `vendor` directory will be exactly the same for
    anyone running this command on any machine!

    This is a very good news for Composer users, and this is paving the way for
    a better quality and security in the packaging of PHP applications.

    This change was introduced in Composer 2.6.4, by me. It is a one-line change
    in Composer and Jordi decided to make it the default behaviour. Needless to
    say that I was very happy to see this change being accepted and released so
    quickly.
  ```)
]

#slide(title: "Reproducibility")[
  #set align(center + horizon)
  #set text(size: .6em)

  #figure(
    image("../../resources/images/essawy-triangle.png", height: 90%),
    caption: [
      Adapted from Essawy et al. 2020 @ESSAWY2020104753
    ]
  )

  #pdfpc.speaker-note(```md
    This slide shows a graphic from a paper published in 2020 by Essawy.

    It shows the difference between something repeatable and reproducable.

    Basically, repeatability is what you're all probably doing everyday.
    You run multiple time the same command on your PHP application.

    Reproducibility is when you can run the same command on your PHP
    application, but on a different machine, and get the same result.

    As we can see, reproducibility is a stronger property than repeatability and
    reaching reproducibility is not an easy task. It requires time and effort.

    Nix is actually the best existing tool to reach that reproducibility, and
    this is at a very light cost.

    Let's continue exploring Nix...

    Oh by the way, let me do a quick parenthesys...

    This presentation was made with Typst, a powerful new opensource typesetting
    system written in rust initially created by two german students during their
    master thesis. It will be available on my Github account today or tomorrow
    and will be totally reproducable, bit-per-bit, and for anyone.
  ```)

]
