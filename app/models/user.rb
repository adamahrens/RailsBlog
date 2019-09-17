# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  role            :integer          default("standard")
#

class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  enum role: { standard: 0, admin: 1 }

  has_secure_password

  before_save { self.email = email.downcase }

  validates :username, presence: true,
                       length: { minimum: 5 },
                       uniqueness: { case_sensitive: false }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                              message: 'must be a valid email' }
end
