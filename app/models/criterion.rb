class Criterion < ActiveRecord::Base
  belongs_to :assignment
  has_many :marks, :dependent => :destroy
  
  after_create do |criterion|
    Grade.find_all_by_assignment_id(criterion.assignment_id).each do |grade|
      Mark.find_or_create_by_grade_id_and_criterion_id(grade.id, criterion.id).save!
    end
  end
end
