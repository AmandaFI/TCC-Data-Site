class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :email, null: false, index: { unique: true }
      t.float :score

      t.timestamps
    end
  end
end
