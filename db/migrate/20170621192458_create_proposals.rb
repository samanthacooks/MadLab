class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.text :summary, null:false
      t.string :hypothesis,null:false
      t.string :status, null:false

      t.integer :proposer_id, foreign_key:true
      t.references :commentable, polymorphic: true, index:true

      t.timestamps
    end
  end
end
