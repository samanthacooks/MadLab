class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :proposals, foreign_key: :proposer_id
  has_many :experiments, foreign_key: :experimenter_id
  has_many :comments
end
