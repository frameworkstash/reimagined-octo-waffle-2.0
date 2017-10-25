class RemoveLevelAndAddSkillLevelToTutorials < ActiveRecord::Migration[5.1]
  def change
    change_table :tutorials do |t|
      t.remove :level_id
      t.string :skill_level, null: false
    end
  end
end
