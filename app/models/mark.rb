class Mark < ActiveRecord::Base
  belongs_to :grade
  belongs_to :criterion
  
  def points
    "#{value} / #{criterion.worth}"
  end
  
  def full_credit?
    value >= criterion.worth
  end
  
  def comment
    return "&nbsp;" if read_attribute(:comment).blank?
    read_attribute(:comment)
  end
end
