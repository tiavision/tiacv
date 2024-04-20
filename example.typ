#import "tiacv.typ": *

#show: tiacv

#page_header("Test User", "Doing my job", "Living somewhere", quote: "Been there, done that", information: (
    link("tel:+4912345678443")[#fa("phone") (+49) 123 456 78 443], 
    link("mailto:my@email.something")[#fa("envelope") my\@email.something], 
    link("https://github.com/tiavision")[#fa-brands([github]) tiavision]),
)

= Summary
asdf 

#lorem(30)

#lorem(30)

// === Skills
#skills(("Typst","C#","GitHub"))

= Work Experience
#cventry(location: [My Home], timespan: [April 2022 -- September 2022])[== Some Company Inc][Job title][
  This is what I did:

  - Something
  - Something else

  #skills(("Typst","C#","GitHub"))
  
]

#cventry(location: [My Home], timespan: [April 2022 -- September 2022])[== Just Another Company][Typst Writer][
  This is what I did:

  - Drink Coffee
  - Do some actual work

  #skills(("Typst","C#","GitHub"))
  
]

= Education
#cventry(location: [My Home], timespan: [April 2022 -- September 2022])[== Some University][Master of Typing][
  This is what I did:

  - Something
  - Something else

  #skills(("Typst","C#","GitHub"))
  
]
