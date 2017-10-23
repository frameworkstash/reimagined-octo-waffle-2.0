# == Schema Information
#
# Table name: levels
#
#  id          :integer          not null, primary key
#  skill_level :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Level < ApplicationRecord
  has_many :tutorials, dependent: :destroy

  validates :skill_level, presence: true
end
