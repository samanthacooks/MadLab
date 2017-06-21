class Observation < ApplicationRecord
  belongs_to :observable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :observer, class_name: "User"
end
