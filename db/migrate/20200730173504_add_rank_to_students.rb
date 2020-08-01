class AddRankToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :rank, :integer
  end
end
