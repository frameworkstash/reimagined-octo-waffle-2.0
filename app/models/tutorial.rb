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
#  level_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_tutorials_on_framework_id  (framework_id)
#  index_tutorials_on_level_id      (level_id)
#
# Foreign Keys
#
#  fk_rails_...  (framework_id => frameworks.id)
#  fk_rails_...  (level_id => levels.id)
#

class Tutorial < ApplicationRecord
  URL_REGEXP = /(http|https):\/\/[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:\/~‌​+#-]*[\w@?^=%&amp;\/‌​~+#-])?/

  belongs_to :framework
  belongs_to :level

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  validates :title, :description, :website, :author, :framework_id, :level_id, presence: true
  validates :website, format: { with: URL_REGEXP,
    message: "is not valid" }
  validates_associated :framework, :level
end
