class Student < ActiveRecord::Base
  has_many :grades
  
  def formatted_grade(obj)
    "#{grade(obj)}/#{obj.points}"
  end
  
  def grade(obj)
    case obj
    when Assignment
      grades.sum('value', :include => :question, :conditions => { :questions => { :assignment_id => obj.id }})
    when Question
      grades.first(:conditions => { :question_id => obj.id }).value rescue 0
    end
  end
  
  def comment(question)
    grades.first(:conditions => { :question_id => question.id }).comment rescue ''
  end
end
