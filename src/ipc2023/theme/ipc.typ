#import "@preview/polylux:0.3.1": *

// Originally contributed by Pol Dellaiera - https://github.com/drupol

// Todo: How to get rid of these colors
#let ecmain = rgb("#990027")
#let ecaccentblue = rgb(75, 197, 222)
#let ecaccentyellow = rgb(255, 192, 0)
#let ectext = rgb(77, 77, 77)
#let ecbackgroundgrey = rgb(234, 234, 234)
#let ecbackgroundblue = rgb(219, 243, 248)

#let ec-colors = state("ec-colors", (:))
#let ec-short-title = state("ec-short-title", none)
#let ec-short-author = state("ec-short-author", none)
#let ec-short-date = state("ec-short-date", none)
#let ec-progress-bar = state("ec-progress-bar", true)

#let ipc-theme(
  aspect-ratio: "16-9",
  short-title: none,
  short-author: none,
  short-date: none,
  ecmain: ecmain,
  ecaccentblue: ecaccentblue,
  ecaccentyellow: ecaccentyellow,
  ectext: ectext,
  ecbackgroundgrey: ecbackgroundgrey,
  ecbackgroundblue: ecbackgroundblue,
  progress-bar: true,
  body,
) = {
  set page(
    paper: "presentation-" + aspect-ratio,
    margin: 0em,
    header: none,
    footer: none,
  )
  set text(size: 25pt)
  show footnote.entry: set text(size: .6em)

  ec-progress-bar.update(progress-bar)
  ec-colors.update((
    ecmain: ecmain,
    ecaccentblue: ecaccentblue,
    ecaccentyellow: ecaccentyellow,
    ectext: ectext,
    ecbackgroundgrey: ecbackgroundgrey,
    ecbackgroundblue: ecbackgroundblue,
  ))
  ec-short-title.update(short-title)
  ec-short-author.update(short-author)
  ec-short-date.update(short-date)

  body
}

#let focus-slide(background-color: none, background-img: none, body) = {
  let background-color = if background-img == none and background-color ==  none {
    ecmain
  } else {
    background-color
  }

  set page(fill: background-color, margin: 1em) if background-color != none
  set page(
    background: {
      set image(fit: "stretch", width: 100%, height: 100%)
      background-img
    },
    margin: 1em,
  ) if background-img != none

  set text(fill: white, size: 2em)

  logic.polylux-slide(body)
}

#let title-slide(
  title: [],
  subtitle: none,
  authors: (),
  date: none,
  logo: none,
  institution: none,
) = {
  let authors = if type(authors) == "array" { authors } else { (authors,) }

  let content = locate( loc => {
    align(center + horizon, {
      v(8em)
      show par: set block(spacing: 0.4em)
      block(
        inset: 0em,
        breakable: false,
        {
          text(size: 2em, fill: white, strong(title))
          if subtitle != none {
            parbreak()
            text(size: 1.2em, fill: ecmain.lighten(50%), subtitle)
          }
        }
      )
      set text(size: .8em)
      grid(
        columns: (1fr,) * calc.min(authors.len(), 3),
        column-gutter: 1em,
        row-gutter: .5em,
        ..authors.map(author => text(fill: ecmain.lighten(50%), author))
      )
      if institution != none {
        parbreak()
        text(fill: ecmain.lighten(50%), size: .9em, institution)
      }
      if date != none {
        parbreak()
        text(fill: ecmain.lighten(50%), size: .8em, date)
      }
    })
  })

  set image(width: 100%)
  place(image("../../../resources/images/IPC_MUC23_by_devmio_Templates_Background_GT-1478_v1.png"))

  logic.polylux-slide(content)
}

#let slide(title: none, header: none, footer: none, new-section: none, body) = {
  let body = pad(x: 1em, bottom: 2em, body)

  let progress-barline = locate(
    loc => {
      if ec-progress-bar.at(loc) {
        let cell = block.with(width: 100%, height: 100%, above: 0pt, below: 0pt, breakable: false)
        let colors = ec-colors.at(loc)

        utils.polylux-progress(ratio => {
          grid(
            rows: 2pt,
            columns: (ratio * 100%, 1fr),
            cell(fill: colors.ecaccentblue),
            cell(fill: colors.ecaccentyellow),
          )
        })
      } else { [] }
    },
  )

  let header-text = {
    if header != none {
      header
    } else {
      if new-section != none {
        utils.register-section(new-section)
      }

      locate(loc => {
        let colors = ec-colors.at(loc)
        box(width:100%)[
          #set align(right)
          #box(width: 100%)[
            #box(inset: .2em, width: 100%)[
              #place(left)[
                #{
                  if title != none {
                      text(size: 1.25em, fill: colors.ecmain, title)
                  }
                }
              ]

              #place(right)[
                #{
                  if title != none {
                      text(size: 1.25em, fill: colors.ecmain.lighten(65%), utils.current-section)
                  }
                }
              ]
            ]
          ]
        ]
      })
    }
  }

  let header = {
    set align(top)
    grid(rows: (auto, auto), row-gutter: 0mm, progress-barline, header-text)
  }

  set page(
    margin: (top: 2em, bottom: 0em, x: 0em),
    header: header,
    footer: footer,
    footer-descent: 0em,
    header-ascent: .6em,
    background: place(bottom + left)[
      #image("../../../resources/images/IPC_MUC23_by_devmio_Templates_Footer_GT-1478_v1.png", fit: "stretch")
    ]
  )

  logic.polylux-slide(body)
}

#let screencast-slide-body(url: none, preview: none, caption: none) = {
  set align(center + horizon)
  set text(size: .5em)

  figure(
    link(url)[
      #image(preview, height: 90%)
    ],
    caption: [ #caption ]
  )
}

#let screencast-slide(title: none, new-section: none, url: none, preview: none, caption: none, ..body) = {
  slide(title: title, new-section: new-section)[
    #screencast-slide-body(
      url: url,
      preview: preview,
      caption: caption,
    )
  ]
}

#let matrix-slide(columns: none, rows: none, ..bodies) = {
  let bodies = bodies.pos()

  let columns = if type(columns) == "integer" {
    (1fr,) * columns
  } else if columns == none {
    (1fr,) * bodies.len()
  } else {
    columns
  }
  let num-cols = columns.len()

  let rows = if type(rows) == "integer" {
    (1fr,) * rows
  } else if rows == none {
    let quotient = calc.quo(bodies.len(), num-cols)
    let correction = if calc.rem(bodies.len(), num-cols) == 0 { 0 } else { 1 }
    (1fr,) * (quotient + correction)
  } else {
    rows
  }
  let num-rows = rows.len()

  if num-rows * num-cols < bodies.len() {
    panic(
      "number of rows (" + str(num-rows) + ") * number of columns (" + str(num-cols) + ") must at least be number of content arguments (" + str(bodies.len()) + ")",
    )
  }

  let cart-idx(i) = (calc.quo(i, num-cols), calc.rem(i, num-cols))
  let color-body(idx-body) = {
    let (idx, body) = idx-body
    let (row, col) = cart-idx(idx)
    let color = if calc.even(row + col) { white } else { silver }
    set align(center + horizon)
    rect(inset: .5em, width: 100%, height: 100%, fill: color, body)
  }

  let content = grid(
    columns: columns,
    rows: rows,
    gutter: 0pt,
    ..bodies.enumerate().map(color-body),
  )

  logic.polylux-slide(content)
}
