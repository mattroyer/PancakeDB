require_relative "../pancakedb"

myDb = PancakeDB.new "seed_data"
p myDb.get_records("state", "ut").collect_elements("carl")
