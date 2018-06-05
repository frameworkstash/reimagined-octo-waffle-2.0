# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  likeable_type :string
#  likeable_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
# Indexes
#
#  index_likes_on_likeable_type_and_likeable_id  (likeable_type,likeable_id)
#  index_likes_on_user_id                        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  validates :likeable_type, :likeable_id, :user_id, presence: true
end
