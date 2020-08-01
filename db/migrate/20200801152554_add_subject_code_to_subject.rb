class AddSubjectCodeToSubject < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :subject_code, :string
  end
end
