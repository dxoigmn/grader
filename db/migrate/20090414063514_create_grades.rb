class CreateGrades < ActiveRecord::Migration
  def self.up
    create_table :grades do |t|
      t.integer :student_id
      t.integer :assignment_id
      t.integer :question_id
      t.integer :value
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :grades
  end
end
