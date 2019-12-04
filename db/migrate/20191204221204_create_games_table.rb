class CreateGamesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :stats
      t.references :user, foregin_key:true   
      t.integer :rounds 
      t.string :call
    end
  end
end
