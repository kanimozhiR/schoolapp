class Subject < ApplicationRecord
	has_many :marks
	has_many :teachers
  belongs_to :klass

  validates_presence_of :name, :message=> "Enter Name"
  validates_presence_of :subject_code, :message=> "Enter subject_code"
  validates_uniqueness_of :subject_code, :message=> "Enter subject code should be unique"

end
