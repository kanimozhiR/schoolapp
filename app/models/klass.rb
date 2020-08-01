class Klass < ApplicationRecord
	has_many :students
	has_many :subjects
	
	validates_presence_of :name, :message=> "Enter Class Name"
	validates_uniqueness_of :name

end
