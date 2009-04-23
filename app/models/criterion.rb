class Criterion < ActiveRecord::Base
  belongs_to :assignment
  has_many :marks
end
