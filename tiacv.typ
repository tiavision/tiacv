#let main = state("main", rgb("414141"))
#let accent = state("accent", rgb("b2967d"))
#let bubbles = state("bubbles", rgb("eff8f8"))
#let linepadding = state("linepadding", 15pt)
#let linewidth = state("linewidth", 1pt)

#let tiacv(content) = {
  set page(margin: (x: 2cm, y: 2cm), numbering: "1/1")
  set text(font: "Source Sans 3", lang: "de", fallback: false)

  show heading: it => {
    set text(font: "Roboto", fill: main.get())
    it
  }

  show heading.where(level: 1): it => {
    set text(font: "Roboto", fill: main.get())
    let h_before = query(selector(
      heading.where(level: 1)
        .or(heading.where(level: 2)))
      .before(here()))
    if h_before.len() > 1 {
      let header = h_before.at(h_before.len()-2)
      if header.location().page() == here().page() and header.depth == 1 {
        place(dx: -linepadding.get(), dy: 1.5pt, line(angle: 270deg, start: (4pt, 4pt), length: here().position().y - header.location().position().y, stroke: linewidth.get() + accent.get()))
      }

    }
    
    place(dx: -linepadding.get(), dy: 1.5pt, circle(fill: accent.get(), height: 8pt))
    let measure = measure(it.body)
    grid(columns: (auto, 1fr), gutter: 3pt, it.body, line(stroke: linewidth.get()/2, start: (0pt, measure.height), length: 100%))
    // v(5pt)
  }

  show heading.where(depth: 2): it => text(font: "Roboto", fill: accent.get(), size: text.size*0.91)[#it.body]
  
  content
}

#let bubble(t) = {
  context {
    box(rect(fill: bubbles.get(), radius: 4pt)[#t])
  }
}

#let skills(skills) = {
  block[
    #for s in skills {
      bubble(s) + h(4pt)
    }
  ]
}

#let page_header(name, position, address, information: (), quote: "", headersep: [#h(8pt) | #h(8pt)]) = {
  context {
    let smallsize = text.size * 0.8
    align(center, [
      #text(fill: rgb(main.get()), size: text.size*3.2)[#name] \
      #smallcaps(text(fill: accent.get(), size: smallsize)[#position]) \
      #text(size: smallsize)[#address] \
      #if information != () {
        text(size: smallsize)[#information.join(headersep)]
      }
      
      #if quote != "" {
        text(fill: accent.get())["#quote"]
      }
    ])
  }
}

#let cventry(company, job, description, location: [], timespan: []) = {
  layout(l => {
    let c = box(width: l.width, [
      #company #h(1fr) #text(fill: accent.get(), weight: "regular")[#location]
      \
      #smallcaps(text(fill: main.get(), weight: "semibold", job)) #h(1fr) #text()[#timespan]

      #description
])
    context {
      let h_before = query(selector(heading).before(here()))
      for header in h_before.rev() {
        if header.location().page() == here().page() and header.depth == 2 {
          place(dx: -linepadding.get(), line(angle: 270deg, start: (4pt, 4pt), length: here().position().y - header.location().position().y - 4pt, stroke: linewidth.get() + accent.get()))
          break
        }
        if header.location().page() == here().page() and header.depth == 1 {
          place(dx: -linepadding.get(), line(angle: 270deg, start: (4pt, 4pt), length: here().position().y - header.location().position().y - 4pt, stroke: linewidth.get() + accent.get()))
          break
        }
      }

      let m = measure(c)
      
      place(dx: -linepadding.get(),
        [
          #place(line(angle: 90deg, start: (4pt, 3pt), length: m.height - 3pt, stroke: linewidth.get() + accent.get()))
          #place(dx: 1pt, dy: 2pt, circle(fill: white, stroke: (linewidth.get()/2) + accent.get(), height: 6pt))
        ]
      )
    }
    c
  })

}

#let fa(name) = {
  text(
    font: "Font Awesome 6 Free Solid",
    [ #name ]
  )
}
#let fa-brands(name) = {
  text(
    font: "Font Awesome 6 Brands",
    [ #name ]
  )
}