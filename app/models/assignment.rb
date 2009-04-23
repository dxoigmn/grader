class Assignment < ActiveRecord::Base
  has_many :questions
  has_many :grades
  has_many :students, :through => :grades, :uniq => true, :group => 'grades.student_id', :order => 'sum(grades.value) DESC'
  
  def points
    questions.sum(:points)
  end
  
  def grades
    students.map { |student| student.grade(self) }
  end
end
