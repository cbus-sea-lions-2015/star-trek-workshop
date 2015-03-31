class CreateSchema < ActiveRecord::Migration
  def change

    create_table :captains do |t|
      t.string :name
      t.string :username
      t.string :password_hashy_digest
    end

    create_table :ships do |t|
      t.references :captain
      t.string :name
    end

    create_table :crew_members do |t|
      t.references :ship
      t.string :name
      t.string :rank
    end

    create_table :roster do |t|
      t.references :crew_member
      t.references :duty
    end

    create_table :duties do |t|
      t.string :name
    end
  end
end
