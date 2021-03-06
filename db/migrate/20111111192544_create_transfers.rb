class CreateTransfers < ActiveRecord::Migration[4.2]
  def self.up
    create_table :transfers do |t|
      t.integer :agreement_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :transfers
  end
end
