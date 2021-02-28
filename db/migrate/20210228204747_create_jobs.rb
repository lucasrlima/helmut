class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.date :date
      t.string :address
      t.text :description
      t.string :issue
      t.string :owner
      t.string :contact
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
