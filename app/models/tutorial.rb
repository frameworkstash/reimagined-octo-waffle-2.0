# == Schema Information
#
# Table name: tutorials
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text             not null
#  website      :string           not null
#  author       :string           not null
#  framework_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  skill_level  :string           not null
#
# Indexes
#
#  index_tutorials_on_framework_id  (framework_id)
#
# Foreign Keys
#
#  fk_rails_...  (framework_id => frameworks.id)
#

class Tutorial < ApplicationRecord
  URL_REGEXP = /(http|https):\/\/[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:\/~‌​+#-]*[\w@?^=%&amp;\/‌​~+#-])?/

  belongs_to :framework

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, :description, :website, :author, :framework_id, :skill_level, presence: true
  validates :website, format: { with: URL_REGEXP,
    message: "is not valid" }
  validates_associated :framework

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def related_posts
    tag_names = self.all_tags.split(",")
    Tutorial.joins(:tags).where(tags: { name: tag_names }).where.not(id: self.id).limit(8)
  end

  def total_comments
    self.comments.count
  end

  def total_likes
    self.likes.count
  end
end
