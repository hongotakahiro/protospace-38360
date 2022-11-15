class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :prototype_name
      t.text :catchcopy
      t.text :concept
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
