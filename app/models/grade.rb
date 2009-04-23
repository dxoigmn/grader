class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment
  has_many :marks, :dependent => :destroy
  
  accepts_nested_attributes_for :marks
  
  after_create do |record|
    Criterion.find_all_by_assignment_id(record.assignment.id).each do |criterion|
      Mark.find_or_create_by_grade_id_and_criterion_id(record.id, criterion.id).save!
    end
  end
  
  def name
    assignment.name
  end
  
  def value
    marks.sum(:value)
  end
  
  def points
    "#{value} / #{assignment.worth}"
  end
  
  def comment
    return "&nbsp;" if read_attribute(:comment).blank?
    read_attribute(:comment)
  end
end
