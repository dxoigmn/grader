class Student < ActiveRecord::Base
  has_many :marks
  
  def formatted_grade(obj)
    "#{grade(obj)}/#{obj.points}"
  end
  
  def grade(obj)
    case obj
    when Assignment
      marks.sum('value', :include => :criterion, :conditions => { :criteria => { :assignment_id => obj.id }})
    when Criterion
      marks.first(:conditions => { :criterion_id => obj.id }).value rescue 0
    end
  end
  
  def comment(criterion)
    value = marks.first(:conditions => { :criterion_id => criterion.id }).comment.strip rescue ''
    value = '&nbsp;' if value.blank?
    value
  end
end
