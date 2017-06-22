class Experiment < ApplicationRecord
  belongs_to :proposal
  belongs_to :experimenter, class_name:'User',foreign_key:'experimenter_id'
  has_many :comments, as: :commentable
  has_many :observations, as: :observable
  has_many :procedures

  validates :category,:results, :conclusions, :proposal_id, :experimenter_id, presence:true
end
