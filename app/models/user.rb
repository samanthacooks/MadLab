class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :proposals, foreign_key: :proposer_id, dependent: :destroy
  has_many :experiments, foreign_key: :experimenter_id, dependent: :destroy
  has_many :comments, dependent: :destroy
end
