# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  displayName :string           not null
#  email       :string           not null
#  photoURL    :string           not null
#  uid         :string           not null
#  providerId  :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_users_on_displayName  (displayName)
#  index_users_on_email        (email)
#  index_users_on_uid          (uid)
#

class User < ApplicationRecord
  has_many :hunted_tutorials, class_name: "Tutorial", foreign_key: "hunter_id", dependent: :destroy
  has_many :written_tutorials, class_name: "Tutorial", foreign_key: "author_id", dependent: :destroy

  validates :displayName, :email, :photoURL, :uid, :providerId, presence: true
  validates :uid, uniqueness: true
end
