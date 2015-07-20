
unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.string :email
    t.integer :password
  end
end
