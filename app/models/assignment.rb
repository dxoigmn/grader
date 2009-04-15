class Assignment < ActiveRecord::Base
  has_many :questions
  has_many :grades
  
  def points
    questions.sum(:points)
  end
end
