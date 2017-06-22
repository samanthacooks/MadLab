class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|
      t.string :body
      t.references :observable,polymorphic:true,index:true
      t.timestamps
    end
  end
end
