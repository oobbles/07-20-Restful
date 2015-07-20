
unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.string :email
    t.integer :password
  end  
end

# unless ActiveRecord::Base.connection.table_exists?(:photos)
#   ActiveRecord::Base.connection.create_table :photos do |t|
#     t.string :title
#     t.string :description
#     t.string :link
#     t.integer :photographer_id
#   end
# end
#
# unless ActiveRecord::Base.connection.table_exists?(:albums)
#   ActiveRecord::Base.connection.create_table :albums do |t|
#     t.string :title
#     t.string :description
#   end
# end
#
# unless ActiveRecord::Base.connection.table_exists?(:albums_photos)
#   ActiveRecord::Base.connection.create_table :albums_photos do |t|
#     t.integer :photo_id
#     t.integer :album_id
#   end
# end