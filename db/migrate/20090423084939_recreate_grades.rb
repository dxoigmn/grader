class RecreateGrades < ActiveRecord::Migration
  def self.up
    create_table :grades do |t|
      t.integer :student_id
      t.integer :assignment_id
      t.text :comment
      
      t.timestamps
    end
    
    Student.all.each do |student|
      Assignment.all.each do |assignment|
        Grade.find_or_create_by_student_id_and_assignment_id(student.id, assignment.id).save!
      end
    end
    
    add_column :marks, :grade_id, :integer
    
    Mark.all.each do |mark|
      mark.grade_id = Grade.find_by_student_id_and_assignment_id(mark.student_id, mark.assignment_id).id
      mark.save!
    end
    
    Grade.all.each do |grade|
      Criterion.find_all_by_assignment_id(grade.assignment_id).each do |criterion|
        Mark.find_or_create_by_grade_id_and_criterion_id(grade.id, criterion.id).save!
      end
    end
    
    remove_column :marks, :student_id
    remove_column :marks, :assignment_id
    
    rename_column :criteria, :points, :worth
  end
  
  def self.down
    rename_column :criteria, :worth, :points
    
    add_column :marks, :student_id, :integer
    add_column :marks, :assignment_id, :integer
    
    Mark.all.each do |mark|
      mark.student_id     = mark.grade.student_id
      mark.assignment_id  = mark.grade.assignment_id
      mark.save!
    end
    
    remove_column :marks, :grade_id
    
    drop_table :grades
  end
end
