class RenameQuestionToCriterion < ActiveRecord::Migration
  def self.up
    rename_table :questions, :criteria
    rename_column :grades, :question_id, :criterion_id
  end

  def self.down
    rename_table :criteria, :questions
    rename_column :grades, :criterion_id, :question_id
  end
end
