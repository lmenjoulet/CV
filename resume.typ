#let config = toml("./config.toml")
#let content = toml("./locales/"+ config.locale + ".toml") 

// styling

#set page(
  margin: 2em
)
#set text(
  font: config.style.font,
  size: 10pt
)
#set par(justify: true)

#set list(
  indent: 1em
)

#show heading: it => [
  #if it.level == 2 {
    line(length: 100%, stroke: 1pt) 
  }
  *#it*
]
#show link: set text(blue)

// content

#set document(
  title: content.title,
  author: content.author,
)

#let sidebar = {[
  #if config.style.visibleProfile [
    #pad(1em)[#image(config.profile)]
    #line(length: 100%)
  ]
  #for contact in content.contacts [
    #contact.category: #h(1fr) #link(contact.link)[#contact.display] \
  ]

  #line(length: 100%)
  === #content.languages.title
  #for language in content.languages.items [
    - *#language.lang*: #language.level #language.proof
  ]
  #line(length: 100%)
  === #content.skills.title
  #for category in content.skills.categories [
    ==== #category.title
    #for skill in category.items [ #highlight(fill: aqua)[#skill]]
  ]

  #line(length: 100%)
  === #content.aboutme.title
  #content.aboutme.content
  
  #line(length: 100%)
  https://github.com/lmenjoulet/CV
]}

#let main = {[
  = #content.author
  _#content.degree _
  == #content.jobs.title
  #for job in content.jobs.items [
    === #job.position 
    _#job.company, #job.location #h(1fr) #job.date _
    
    #for keypoint in job.description [
      - #keypoint
    ]
  ]

  == #content.trainings.title
  #for training in content.trainings.items [
    === #training.title
    _#training.school, #training.location #h(1fr) #training.date _
    
    #for keypoint in training.description [
      - #keypoint
    ]
    
  ]
]}

// Body
#align(center)[
  #set text(size: 1.5em)
  #underline[*Curriculum Vitae*]
]

#grid(
  columns: (2fr, 5.5fr),
  column-gutter: 2em,
  sidebar,
  main
)

