class Assignment < ActiveRecord::Base
  has_many :questions
  has_many :grades, :through => :questions
  
  def total_points
    questions.sum(:points)
  end
end
