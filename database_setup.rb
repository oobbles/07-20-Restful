
unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.string :email
    t.string :password
  end
end

unless ActiveRecord::Base.connection.table_exists?(:articles)
  ActiveRecord::Base.connection.create_table :articles do |t|
    t.string :title
    t.text :content
    t.integer :user_id
  end
end
