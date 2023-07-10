class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :description
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
