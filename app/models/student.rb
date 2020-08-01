class Student < ApplicationRecord
	has_many :marks
  belongs_to :klass

validates_presence_of :student_id, :message=> "Enter Student ID"
validates_presence_of :name, :message=> "Enter  Name"
validates_presence_of :age, :message=> "Enter Age"
validates_presence_of :gender, :message=> "Enter gender"

validates_uniqueness_of :name

  def total_marks
  	@total_mark = Student.find(self.id).marks.pluck("sum(mark) as mark_sum").first
  	Student.find(self.id).update(total_marks: @total_mark)
  	return @total_mark
  end

end

