class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment
  belongs_to :criterion
end
