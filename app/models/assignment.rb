class Assignment < ActiveRecord::Base
  has_many :criteria
  has_many :grades
  has_many :students, :through => :grades, :uniq => true, :group => 'grades.student_id', :order => 'sum(grades.value) DESC'
  
  def points
    criteria.sum(:points)
  end
  
  def grades
    students.map { |student| student.grade(self) }
  end
end
