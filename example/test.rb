require_relative "../pancakedb"

myDb = PancakeDB.new "#{File.dirname(__FILE__)}/seed_data"
p myDb.get_records("state", "ut").collect_elements("carl")
