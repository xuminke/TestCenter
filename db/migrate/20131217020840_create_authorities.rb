class CreateAuthorities < ActiveRecord::Migration
  def change
    create_table :authorities do |t|
      t.string :user_authority

      t.timestamps
    end
  end
end
