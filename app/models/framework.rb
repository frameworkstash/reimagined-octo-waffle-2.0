# == Schema Information
#
# Table name: frameworks
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Framework < ApplicationRecord
  has_many :tutorials, dependent: :destroy

  validates :title, :description, presence: true
end
