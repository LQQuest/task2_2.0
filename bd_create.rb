require_relative 'data_base'
require_relative 'factory'
require_relative 'query'

define_my_db(:my_database) do |db|
  db.create_table(:order) do |t|
    t.column(:autoincrement_primary_key, :id)
    t.column(:integer, :department_id)
    t.column(:string, :description)
    t.column(:datetime, :created_at)
    t.save
  end

  db.create_table(:comment) do |t|
    t.column(:autoincrement_primary_key, :id)
    t.column(:integer, :order_id)
    t.column(:string, :description)
    t.save
  end
end

create_content

