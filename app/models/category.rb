# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  validates :name, presence: true,
                   length: { minimum: 3, maximum: 25 },
                   uniqueness: { case_sensitive: false }
end
