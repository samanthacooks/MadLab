# create users
proposers = [
15.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Name.name
  )
end
]

experimenters = [
15.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Name.name
  )
end
]
# create proposals
proposals = [
15.times do
  proposers.sample.proposals.create(
    summary: Faker::Lorem.sentence,
    hypothesis: Faker::Lorem.paragraph,
    status: ["open", "in progress", "close", "archived"].sample
  )
end
]

# create experiments
experiments = [
15.times do
  experimenters.sample.experiments.create(
    category: Faker::App.name,
    results: Faker::Lorem.sentence,
    conclusions: Faker::Lorem.sentences,
    proposal_id: proposals.sample.id,
  )
end
]

# create observations on procedures
experiments_observations = [
15.times do
  experiments.sample.observations.create(
    body:Faker::Lorem.paragraph
  )
end
]

# create comments on experiments
experiments_comments = [
15.times do
  experiments.sample.comments.create(
    body:Faker::Lorem.paragraph
  )
end
]

# create procedures
experiments_procedures = [
15.times do
  experiments.sample.procedures.create(
    steps: Faker::Lorem.sentence,
  )
end
]


# create comments on proposals
proposal_comments = [
15.times do
  proposals.sample.comments.create(
    body:Faker::Lorem.paragraph
  )
end
]

proposal_experiment = [
15.times do
  proposals.sample.experiments.create(
    category: Faker::App.name,
    results: Faker::Lorem.sentence,
    conclusions: Faker::Lorem.sentences,
    proposal_id: proposals.sample.id,
    experimenter_id:experimenters.sample.id
  )
end
]

procedures_observations = [
15.times do
  experiments_procedures.sample.observations.create(
    body:Faker::Lorem.paragraph
end
]

# create comments on observations
observations_comments = [
15.times do
  experiments_observations.sample.comments.create(
    body:Faker::Lorem.paragraph
  )
end
]
