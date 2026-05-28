#let report(
  course_code: "",
  course_name: "",
  assignment_no: "",
  assignment_title: "",
  doc_type: "Report",
  // Author Info
  // Individual: ((name: "Ahmad Ali", reg: "FA24-BSE-012"),)
  // Group: ((name: "Ahmad Ali", reg: "FA24-BSE-012"), (name: "Abdul Kareem", reg: "FA24-BSE-123"))
  authors: (),
  instructor: "",
  date: datetime.today().display("[month repr:long] [day], [year]"),
  show_toc: false,
  show_page_numbers: false,
  body,
) = {
  set page(
    paper: "a4",
    margin: (top: 2.5cm, bottom: 2.5cm, left: 1.5cm, right: 1.5cm),
    numbering: if show_page_numbers { "1" } else { none },
  )

  set text(
    font: "Noto Serif",
    size: 11pt,
  )

  set heading(numbering: "1.1.")
  show heading: set block(below: 1.2em, above: 1.2em)
  show heading: set text(font: "Noto Serif")

  show raw: set text(font: "IBM Plex Mono")
  show raw.where(block: false): set text(size: 11pt)
  show raw.where(block: true): set text(size: 10pt)

  show math.equation: set text(font: "Libertinus Math", size: 16pt)

  set par(
    justify: true,
    leading: 1.0em,
    first-line-indent: 0pt,
    spacing: 1.5em,
  )

  show table.cell.where(y: 0): strong
  show table: set table(
    fill: (x, y) => if y == 0 { rgb("#E6E6E6") } else { none },
  )
  show table.cell: set text(size: 10pt)
  show table.cell: set par(justify: true)
  // show table.cell: set par(linebreaks: "optimized", justify: true)


  align(center)[
    #v(0.5cm)
    #image("assets/logo.png", width: 35%)
    #v(1.5em)

    #text(size: 18pt, weight: "bold")[
      COMSATS University Islamabad, Lahore Campus
    ]
    #v(0.5em)

    #text(size: 16pt, weight: "medium")[
      #course_code | #course_name
    ]
    #v(1.5em)

    #text(size: 16pt)[
      #if assignment_no != "" {
        [#doc_type \##assignment_no]
        linebreak()
        [#assignment_title]
      } else {
        [#assignment_title]
      }
    ]
    #v(3em)
  ]

  if authors.len() == 1 {
    grid(
      columns: (auto, auto),
      column-gutter: 15pt,
      row-gutter: 12pt,
      [*Name:*], [#authors.at(0).at("name")],
      [*Registration No:*], [#authors.at(0).at("reg")],
      [*Course Instructor:*], [#instructor],
      [*Date:*], [#date],
    )
  } else if authors.len() > 1 {
    align(center)[
      #text(size: 14pt, weight: "bold")[Group Members]
      #v(0.5em)

      #table(
        columns: (1fr, 1fr),
        inset: 10pt,
        align: (left, left),
        stroke: (x, y) => if y == 0 { (bottom: 0.7pt + black) } else { none },
        fill: (x, y) => if y == 0 { luma(230) } else { none },

        table.header([*Name*], [*Registration No*]),
        ..authors.map(author => (author.at("name"), author.at("reg"))).flatten(),
      )
    ]

    v(3em)

    align(center)[
      #grid(
        columns: 2,
        column-gutter: 3em,
        row-gutter: 0.5em,
        align: (right, left),

        [*Course Instructor:*], [#instructor],
        [*Date:*], [#date],
      )
    ]
  }

  pagebreak()

  if show_toc {
    outline(
      title: "Contents",
      indent: auto,
    )
    pagebreak()
  }

  body
}
