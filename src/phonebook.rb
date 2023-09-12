class PhoneBook
  def initialize
    @phonebook = []
  end

  def add(name, number, is_listed)
    return false unless valid_number_format?(number)
    return false if @phonebook.any? { |entry| entry[:name] == name }

    existing_entry = @phonebook.find { |entry| entry[:number] == number && entry[:listed] }
    return false if existing_entry && is_listed

    @phonebook << { name: name, number: number, listed: is_listed }
    true
  end

  def valid_number_format?(number)
    /^\d{3}-\d{3}-\d{4}$/ =~ number
  end

  def lookup(name)
    existing_entry = @phonebook.find { |entry| entry[:name] == name && entry[:listed] }
    return nil if existing_entry.nil?

    existing_entry[:number]
  end

  def lookupByNum(number)
    existing_entry = @phonebook.find { |entry| entry[:number] == number && entry[:listed] }
    return nil if existing_entry.nil?

    existing_entry[:name]
  end

  def namesByAc(areacode)
    name_arr = []
    @phonebook.each { |entry| name_arr << entry[:name] if entry[:number][0, 3] == areacode }
    name_arr
  end
end
