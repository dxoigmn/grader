class FixDefaultValues < ActiveRecord::Migration
  def self.up
    change_column :assignments, :name, :string, :default => ''
    
    change_column :criteria, :worth, :integer, :default => 0
    change_column :criteria, :title, :string, :default => ''
    change_column :criteria, :help, :text, :default => ''
    
    change_column :marks, :value, :integer, :default => 0
    change_column :marks, :comment, :text, :default => ''
    
    change_column :grades, :comment, :text, :default => ''
    
    change_column :students, :name, :string, :default => ''
    change_column :students, :email, :string, :default => ''
    
    Assignment.all.each do |assignment|
      assignment.name = '' unless assignment.name
      assignment.save!
    end
    
    Criterion.all.each do |criteria|
      criteria.title  = ''  unless criteria.title
      criteria.worth  = 0   unless criteria.worth
      criteria.help   = ''  unless criteria.help
      criteria.save!
    end
    
    Mark.all.each do |mark|
      mark.value    = 0   unless mark.value
      mark.comment  = ''  unless mark.comment
      mark.save!
    end
    
    Grade.all.each do |grade|
      grade.comment = '' unless grade.comment
      grade.save!
    end
    
    Student.all.each do |student|
      student.name  = '' unless student.name
      student.email = '' unless student.email
      student.save!
    end
    
  end

  def self.down
  end
end
