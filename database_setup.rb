
unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.string :email
    t.integer :password
  end
  
  unless ActiveRecord::Base.connection.table_exists?(:stories)
  ActiveRecord::Base.connection.create_table :stories do |t|
    t.string :name
    t.text :content
    t.integer :user_id
  end
end
