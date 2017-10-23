# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  likeable_type :string
#  likeable_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_likes_on_likeable_type_and_likeable_id  (likeable_type,likeable_id)
#

class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true

  validates :likeable_type, :likeable_id, presence: true
end
