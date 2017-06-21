class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|
      t.integer :observable_id
      t.string :observable_type
      t.references :commentable, polymorphic:true,index:true
      t.timestamps
    end
  end
end
