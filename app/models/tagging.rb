# == Schema Information
#
# Table name: taggings
#
#  id          :integer          not null, primary key
#  tutorial_id :integer
#  tag_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_taggings_on_tag_id       (tag_id)
#  index_taggings_on_tutorial_id  (tutorial_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#  fk_rails_...  (tutorial_id => tutorials.id)
#

class Tagging < ApplicationRecord
  belongs_to :tutorial
  belongs_to :tag
end
