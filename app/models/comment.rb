# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :text             not null
#  commentable_type :string
#  commentable_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_comments_on_commentable_type_and_commentable_id  (commentable_type,commentable_id)
#

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  has_many :likes, as: :likeable, dependent: :destroy

  validates :content, :commentable_type, :commentable_id, presence: true

  def total_likes
    self.likes.count
  end
end
