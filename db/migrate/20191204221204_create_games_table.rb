class CreateGamesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :status
      t.references :user, foregin_key:true   
      t.string :computer_call
      t.string :call
    end
  end
end
