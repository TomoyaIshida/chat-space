class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :user,foreign_key: true, index: true
      t.references :group,foreign_key: true, index: true
      t.text :body,null: false
      t.string :image
      t.timestamps
    end
  end
end
