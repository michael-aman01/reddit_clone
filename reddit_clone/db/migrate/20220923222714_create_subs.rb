class CreateSubs < ActiveRecord::Migration[7.0]
  def change
    create_table :subs do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :moderator, null:false
      t.string :title, null:false
      t.text :description

      t.timestamps
    end
    add_index :subs, :title, unique:true
  end
end
