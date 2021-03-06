class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.text :status
      t.belongs_to :project, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
