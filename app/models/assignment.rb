class Assignment < ActiveRecord::Base
  has_many :criteria
  has_many :marks
  has_many :students, :through => :marks, :uniq => true, :group => 'marks.student_id', :order => 'sum(marks.value) DESC'
  
  def points
    criteria.sum(:points)
  end
  
  def grades
    students.map { |student| student.grade(self) }
  end
end
