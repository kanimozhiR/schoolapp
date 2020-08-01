class AddTotalMarksToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :total_marks, :integer
  end
end
