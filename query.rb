require 'csv'
require 'benchmark'

class Query

  def initialize(db_name, table_name)
    @db_name = db_name
    @tb_name = table_name
    @table = CSV.table("#{@db_name}/#{@tb_name}.csv")
  end

  def find_by(column_name, value)
    @table.find { |row| row[column_name.to_sym] == value }
  end

  def bsearch_find_by(column_name, value)
    @table[@table[column_name.to_sym].drop(1).sort.bsearch_index { |x| x == value }]
  end

  def hash_create(column_name)
    # стоит применять хеширование для ключей @hash, однако так как у нас int, это останется на доработку
    @hash = @table[column_name.to_sym].drop(1).map.with_index { |i, value| [i, value] }.to_h
  end

  def find_by_hash(value)
    @table[@hash[value] + 1]
  end

  def type(column_name)
    puts "#{column_name} type: #{@table[column_name.to_sym].take(1)}"
  end
end


