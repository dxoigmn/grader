class Assignment < ActiveRecord::Base
  has_many :questions
  
  def total_points
    questions.sum(:points)
  end
end
