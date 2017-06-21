class Proposal < ApplicationRecord
  belongs_to :proposer, class_name:'User', foreign_key:'proposer_id'
  has_many :comments, as: :commentable
end
