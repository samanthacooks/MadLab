# create users
15.times do 
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, encrypted_password: Faker::Name.name)
end

# create proposals
15.times do 
 Proposal.create(summary: Faker::Lorem.sentence, hypothesis: Faker::Lorem.paragraph, status: ["open", "in progress", "close", "archived"].sample, proposer_id: rand(1..15) )
end

# create experiments
15.times do 
  Experiment.create(category: Faker::App.name, results: Faker::Lorem.sentence, conclusions: Faker::Lorem.sentences, proposal_id: rand(1..15), experimenter_id: rand(1..15))
end

# create procedures
15.times do 
	Procedure.create(steps: Faker::Lorem.sentence, experiment_id: rand(1..15))
end

# create observations on procedures
15.times do 
	Observation.create(observable_id: rand(1..15), observable_type: "Procedure")
end

# create observations on experiments
15.times do 
	Observation.create(observable_id: rand(1..15), observable_type: "Experiment")
end

# create comments on proposals
15.times do 
	Comment.create(commentable_id: rand(1..15), commentable_type: "Proposal")
end

# create comments on experiments
15.times do 
	Comment.create(commentable_id: rand(1..15), commentable_type: "Experiment")
end

# create comments on observations
15.times do 
	Comment.create(commentable_id: rand(1..15), commentable_type: "Observation")
end
