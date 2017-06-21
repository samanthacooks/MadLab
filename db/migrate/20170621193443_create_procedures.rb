class CreateProcedures < ActiveRecord::Migration[5.1]
  def change
    create_table :procedures do |t|
      t.string :steps, null:false
      t.integer :experiment_id, foreign_key:true
      t.references :observable, polymorphic:true, index:true
      t.timestamps
    end
  end
end