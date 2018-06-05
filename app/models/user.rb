# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  firstName       :string           not null
#  lastName        :string           not null
#  username        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  photoURL        :string           not null
#  headline        :string
#  uid             :string
#  providerId      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email)
#  index_users_on_username  (username)
#

class User < ApplicationRecord
  has_secure_password

  has_many :likes, dependent: :destroy
  has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :posts_with_comments, -> { limit(5) }, :through => :comments, :source => :commentable, source_type: 'Tutorial'

  has_many :hunted_tutorials, class_name: "Tutorial", foreign_key: "hunter_id", dependent: :destroy
  has_many :written_tutorials, class_name: "Tutorial", foreign_key: "author_id", dependent: :destroy

  validates :firstName, :lastName, :username, :email, :password_digest, :photoURL, presence: true
  validates :username, :email, uniqueness: true

  def favorited?(tutorial)
    likes.find_by(likeable_id: tutorial.id).present?
  end
end
