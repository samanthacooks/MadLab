# create users
proposers = []
15.times do
  proposers << User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Name.name
    )
end

experimenters = []
15.times do
  experimenters << User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Name.name
    )
end

# create comments on proposals
# create proposals
proposals = []
15.times do
 proposals << proposers.sample.proposals.create(
  summary: Faker::Lorem.sentence,
  hypothesis: Faker::Lorem.paragraph,
  status: ["open", "in progress", "close", "archived"].sample
  )
end

# create experiments
experiments = []
15.times do
  experiments << experimenters.sample.experiments.create(
    category: Faker::App.name,
    results: Faker::Lorem.sentence,
    conclusions: Faker::Lorem.sentences,
    proposal_id: proposals.sample.id,
  )
end

comments = []
15.times do
	comments << Comment.create(
    commentable:experimenters.sample,
    )
end

# create procedures
15.times do
  Procedure.create(
    steps: Faker::Lorem.sentence,
    experiment_id: rand(1..15),
    # observable:
    )
end

# create observations on procedures
15.times do
  Observation.create(
    observable_id: rand(1..15),
    observable_type: "Procedure",
    )
end

# create observations on experiments
15.times do
  Observation.create(
    observable_id: rand(1..15),
    observable_type: "Experiment"
    )
end


# create comments on experiments
15.times do
	Comment.create(
    commentable_id: rand(1..15),
    commentable_type: "Experiment"
    )
end

# create comments on observations
15.times do
	Comment.create(
    commentable_id: rand(1..15),
    commentable_type: "Observation"
    )
end
