# == Schema Information
#
# Table name: questions
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text             not null
#  help_type_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_questions_on_help_type_id  (help_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (help_type_id => help_types.id)
#

class Question < ApplicationRecord
  belongs_to :help_type

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  validates :title, :description, :help_type_id, presence: true
  validates_associated :help_type
end
