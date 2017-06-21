class CreateExperiments < ActiveRecord::Migration[5.1]
  def change
    create_table :experiments do |t|
      t.string :category, null:false
      t.text :results, null:false
      t.text :conclusions,null:false
      t.integer :proposal_id,foreign_key:true
      t.integer :experimenter_id,foreign_key:true
      t.references :commentable, polymorphic:true, index:true
      t.references :observable, polymorphic:true, index:true
      t.timestamps
    end
  end
end
