class CreateXlsForms < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps
    end

    create_table :xls_forms do |t|
      t.belongs_to :user, index: true #, foreign_key: true
      t.string :file_name
      # вроде у них user_id должен появиться
      t.timestamps
    end
  end
end
