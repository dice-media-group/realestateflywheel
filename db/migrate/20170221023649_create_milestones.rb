class CreateMilestones < ActiveRecord::Migration[5.0]
  def change
    create_table :milestones do |t|
      t.belongs_to :contact, foreign_key: true
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
