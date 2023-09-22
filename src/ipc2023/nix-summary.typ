#import "imports/preamble.typ": *

#focus-slide[
  #set align(center + horizon)
  #set text(size: 2em, fill: white, font: "Virgil 3 YOFF")

  What is Nix?

  #pdfpc.speaker-note(```md
    Now that the theory is done, I guess you can all answer the question right?
  ```)
]

#slide(title: "Summary", new-section: "Nix")[
  #set align(center + horizon)

  #uncover("1-")[
    #line(length: 100%, stroke: 1pt + rgb("#eeeeee"))
    Nix is a set of concepts and tools to manage software and configuration in a reproducible way.
    #line(length: 100%, stroke: 1pt + rgb("#eeeeee"))
  ]

  #set align(left + horizon)

  #uncover("2-")[1. Package manager]
  #uncover("3-")[2. Programming language]
  #uncover("4-")[3. Software builder]
  #uncover("5-")[4. Configuration management tool]

  #pdfpc.speaker-note(```md
    As we have seen, Nix is multiple things and if I had to give a summary, it
    would be the following:

    Nix is an idea regrouping multiple abstracted concepts and concrete tools:

    - Nix is a package manager,
    - Nix is a programming language,
    - Nix is a software builder,
    - Nix is a configuration management tool.
  ```)
]

#focus-slide[
  #set align(center + horizon)
  #set text(size:1.8em, fill: white, font: "Virgil 3 YOFF")

  Is Nix complex?

  #pdfpc.speaker-note(```md
    Well, that's a good question, I think it's quite subjective and let me make
    my point...

    While it's true that working with Nix is different from coding in PHP, it's
    really about adopting a new perspective.

    For those who have some experience with functional programming, getting the
    hang of Nix shouldn't be too challenging. In fact, understanding Nix could
    only enhance your PHP development skills.

    To share a personal anecdote and if I had to give you a comparison with my experience, learning Nix has been quite fast even if there are still many
    things I don't understand. However, I still find it difficult sometimes
    because I don't have much knowledge in functional programming... even if I
    tend to improve that part lately.
  ```)
]

#focus-slide(background-color: rgb("#111111"))[
  #set align(center + horizon)
  #set text(size: .2em)

  #figure(
    image("../../resources/screenshots/Screenshot_20231016_134841.png"),
    caption: [
      #link("https://main.elk.zone/vmst.io/@libreivan/111243015119696215")[https://main.elk.zone/vmst.io/@libreivan/111243015119696215]
    ]
  )

  #pdfpc.speaker-note(```md
    Usually, I end up like Ivan on this screenshot: "WHY THIS IS NOT WORKING,
    I'M DOING IT EXACTLY LIKE IN THE DOCUMENTATION!"...

    And then.... Ah...Oh... it was just a missing semicolon...

    Ok the theory is done now, we can move on to the practice. I've been making
    a couple of pre-recorded demos that I will comment live, they are made in
    the context of PHP development.

    We'll start with the basics and gradually ramp up to more complex Nix use
    cases.
  ```)
]
