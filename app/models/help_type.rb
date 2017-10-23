# == Schema Information
#
# Table name: help_types
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HelpType < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :title, presence: true
end
