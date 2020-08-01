class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
