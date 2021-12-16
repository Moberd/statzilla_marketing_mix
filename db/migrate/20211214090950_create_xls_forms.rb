class CreateXlsForms < ActiveRecord::Migration[6.1]
  def change
    create_table :xls_forms do |t|
      t.string :name
      t.string :email
      t.string :file_name

      t.timestamps
    end
  end
end
