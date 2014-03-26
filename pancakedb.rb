class PancakeDB
  attr_accessor :entries

  def initialize(file, delimiter = "|") # Pipe symbol is the default delimiter
    file = File.readlines(file).map! { |item| item.chomp }
    @delimiter = delimiter
    @columns = file[0]
    @rows = file[1..-1]
  end

  def number_of_records
    @rows.count
  end

  def get_all_by_name(name)
    @entries = []
    @index = @columns.split(@delimiter).find_index { |entry| entry.match /#{name}/i }

    @rows.each do |row|
      @entries << row.split(@delimiter)[@index]
    end

    @entries
  end

  def get_records(type, match)
    @entries = []
    @index = @columns.split(@delimiter).find_index { |entry| entry.match /#{type}/i }

    @rows.each_with_index do |row, index|
      @entries << @rows[index] if row.split(@delimiter)[@index].match /#{match}/i
    end

    @entries.map! { |entry| entry.split(@delimiter) }
  end

end

class Array
  def collect_elements(name)
    found = self.map { |entry| entry.select { |elem| elem.match(/#{name}/i) } }.reject { |elem| elem.empty? }.flatten
    found.map { |elem| self.assoc elem }.compact
  end
end
