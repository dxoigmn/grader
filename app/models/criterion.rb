class Criterion < ActiveRecord::Base
  belongs_to :assignment
  has_many :marks, :dependent => :destroy
  
  after_create do |record|
    Grade.all.each do |grade|
      Mark.find_or_create_by_grade_id_and_criterion_id(grade.id, record.id).save!
    end
  end
end
