class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.integer :host_id
      t.string :name
      t.string :description
      t.string :price_per_night
      t.date :start_date
      t.date :end_date     
    end
  end
end
