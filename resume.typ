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
  author: content.name,

)

#let sidebar = {[
  #image("./photo.png")
  #line(length: 100%)
  #for contact in content.contacts [
    #contact.category: #h(1fr) #link(contact.link)[#contact.display]
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

]}

#let main = {[
  = #content.name
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
  #set text(size: 2em)
  *Curriculum Vitae*
]

#grid(
  columns: (2fr, 5.5fr),
  column-gutter: 2em,
  sidebar,
  main
)

