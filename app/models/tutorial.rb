# == Schema Information
#
# Table name: tutorials
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text             not null
#  website      :string           not null
#  author_name  :string
#  framework_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  skill_level  :string           not null
#  hunter_id    :integer
#  author_id    :integer
#  slug         :string
#
# Indexes
#
#  index_tutorials_on_author_id     (author_id)
#  index_tutorials_on_framework_id  (framework_id)
#  index_tutorials_on_hunter_id     (hunter_id)
#  index_tutorials_on_slug          (slug)
#
# Foreign Keys
#
#  fk_rails_...  (framework_id => frameworks.id)
#

class Tutorial < ApplicationRecord
  URL_REGEXP = /(http|https):\/\/[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:\/~‌​+#-]*[\w@?^=%&amp;\/‌​~+#-])?/

  belongs_to :framework
  belongs_to :hunter, class_name: "User"
  belongs_to :author, class_name: "User"

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, :description, :website, :hunter_id, :framework_id, :skill_level, presence: true
  validates :website, format: { with: URL_REGEXP,
    message: "is not valid" }
  validates :website, uniqueness: true
  validates_associated :framework, :hunter, :author

  scope :upvoted_by, -> (username) { joins(:likes).where(likes: { user: User.where(username: username) }) }
  scope :submitted_by, -> (username) { where(hunter: User.where(username: username)) }

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
    Tutorial.joins(:tags).where(tags: { name: tag_names }).where.not(id: self.id).distinct.limit(8)
  end

  def total_comments
    self.comments.count
  end

  def total_likes
    self.likes.count
  end

  before_validation do
    self.slug ||= "#{title.to_s.parameterize}"
  end
end
