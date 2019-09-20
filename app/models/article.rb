# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Article < ApplicationRecord
  belongs_to :user

  has_many :tags
  has_many :categories, through: :tags

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }

  scope :recent, -> { order(created_at: :desc) }
end
