# frozen_string_literal: true

require 'fileutils'
require 'csv'

class DataBase

  def initialize(name)
    FileUtils.mkdir_p name.to_s
    @file_path = name.to_s
  end

  def create_table(name)
    @type = []
    @name = []
    @file_csv = "#{@file_path}/#{name}.csv"
    @table = CSV.open(@file_csv, "w+")
    yield self if block_given?
  end

  def column(type, name)
    @type << type
    @name << name
  end

  def save
    @table << @name
    @table << @type
  end

end

def define_my_db(name)
  db = DataBase.new(name)
  yield db
end
