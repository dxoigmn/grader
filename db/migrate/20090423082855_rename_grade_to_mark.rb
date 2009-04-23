class RenameGradeToMark < ActiveRecord::Migration
  def self.up
    rename_table :grades, :marks
  end

  def self.down
    rename_table :marks, :grades
  end
end
