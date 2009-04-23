class Student < ActiveRecord::Base
  has_many :grades, :dependent => :destroy
  has_many :assignments, :through => :grades
  
  after_create do |record|
    Assignment.all.each do |assignment|
      Grade.find_or_create_by_student_id_and_assignment_id(record.id, assignment.id).save!
    end
  end
  
  def grade
    grades.inject(0) { |sum, grade| sum += grade.value }.to_f / assignments.inject(0) { |sum, assignment| sum += assignment.worth }.to_f
  end
end
