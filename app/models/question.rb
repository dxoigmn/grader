class Question < ActiveRecord::Base
  belongs_to :assignment
  has_many :grades
  
  def assignment_name
    assignment.name
  end
end
