class Assignment < ActiveRecord::Base
  has_many :criteria, :dependent => :destroy
  has_many :grades, :dependent => :destroy
  has_many :students, :through => :grades, :uniq => true, :group => 'grades.student_id', :order => 'sum(marks.value) DESC'
  
  after_create do |assignment|
    Student.all.each do |student|
      Grade.find_or_create_by_student_id_and_assignment_id(student.id, assignment.id).save!
    end
  end
  
  def worth
    criteria.sum(:worth)
  end
end
