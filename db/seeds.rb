10.times do |blog|
  Post.create!(
    title: "#{Faker::HarryPotter.character}",
    body: "#{Faker::HarryPotter.quote}"
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
    subtitle: "#{Faker::StarWars.planet}",
    body: "#{Faker::StarWars.quote}",
    main_image: "http://via.placeholder.com/700x400/faf",
    thumb_image: "http://via.placeholder.com/350x200/faf"
  )
end

puts "9 portfolio items created"
