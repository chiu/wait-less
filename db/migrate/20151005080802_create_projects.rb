class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.integer :time_estimate
      t.datetime :time_start
      t.datetime :time_end
      t.integer :reward_monetary
      t.text :reward_non_monetary

      t.timestamps null: false
    end
  end
end
