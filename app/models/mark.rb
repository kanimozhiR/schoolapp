class Mark < ApplicationRecord
  belongs_to :subject
  belongs_to :student
  
  validates_presence_of :mark, :message=> "Enter Mark"
end
