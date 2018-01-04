3.times do |topic|
  Topic.create!(
    title:"Topic #{topic}"
  )
end

puts "3 topics created"

10.times do |blog|
  Post.create!(
    title: "#{Faker::HarryPotter.character}",
    body: "#{Faker::HarryPotter.quote}",
    topic_id: rand(1..3)
  )
end

puts "10 blog post created"

5.times do |skill|
Skill.create!(
  title: "#{Faker::ProgrammingLanguage.name}",
  percent_utilized: "#{rand(100)}"
)
end

puts "5 skills created"

9.times do |portfolio_item|
  Portfolio.create!(
    title: "#{Faker::StarWars.character}",
    subtitle: "Ruby on Rails",
    body: "#{Faker::StarWars.quote}",
    main_image: "http://via.placeholder.com/700x400/faf",
    thumb_image: "http://via.placeholder.com/350x200/faf"
  )
end

puts "9 portfolio items created"

1.times do |portfolio_item|
  Portfolio.create!(
    title: "#{Faker::StarWars.character}",
    subtitle: "React",
    body: "#{Faker::StarWars.quote}",
    main_image: "http://via.placeholder.com/700x400/aff",
    thumb_image: "http://via.placeholder.com/350x200/aff"
  )
end

puts "1 portfolio items created"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end

puts "3 technologies created"
