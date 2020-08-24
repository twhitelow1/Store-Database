# require the table gem for table display and pstore for storing data
require "pstore"
require "tty-table"

#initial record count. This will be used to genereate unique ids
@record_count = 2
# Class to create instances of snowboards that are stored in snowboards array
class Snowboard
  def initialize(id, brand, model, year, price, in_stock)
    @id = id
    @brand = brand
    @model = model
    @year = year
    @price = price
    @in_stock = true
  end

  def id
    @id
  end

  def brand
    @brand
  end

  def model
    @model
  end

  def year
    @year
  end

  def price
    @price
  end

  def in_stock
    @in_stock
  end

  def in_stock=(status)
    @in_stock = status
  end
end

#Initial Records
snowboards = [
  Snowboard.new(1, "burton", "Free Thinker", 2020, 535, true),
  Snowboard.new(2, "burton", "Deep Thinker", 2020, 535, true),
]

# Loop through the snowboards array to build each row and then return the rendered table
def make_table(snowboards)
  new_table = TTY::Table.new [["ID", "Brand", "Model", "Year", "Price", "In Stock?"]]
  renderer = TTY::Table::Renderer::ASCII.new(table)
  for i in 0...snowboards.length
    new_table << ["#{snowboards[i].id}", "#{snowboards[i].brand}", "#{snowboards[i].model}", "#{snowboards[i].year}", "#{snowboards[i].price}", "#{snowboards[i].in_stock}"]
  end
  return renderer.render
end

# Get the snowboard instance from the snowboard array by id
# Return the snowboard instance
def get_snowboard(id, snowboards)
  snowboards.each do |snowboard|
    if (snowboard.id == id.to_i)
      return snowboard
    end
  end
end

# Get the index of the snowboard instance in the snowboards array based on id
def get_index(id, snowboards)
  index = 0
  for i in 0...snowboards.length
    if snowboards[i] == id.to_i
      puts "hi"
    end
    index += 1
  end
end

# Delete snowboard from the snowboards array
# Use a for look to find the snowboard's index based using its id to locate it
# When the id is matched return that index number.
def delete_snowboard(snowboards)
  puts "Snowboard Id to be delete: "
  id = gets.chomp.to_i
  index = 0
  for i in 0...snowboards.length
    if snowboards[i].id == id
      snowboards.slice!(i)
      break
    end
    index += 1
  end
end

# update the snowboard's in stock status
def update_snowboard(snowboards)
  puts "What's the id for the snowboard you want to update?"
  id = gets.chomp
  current_snowboard = get_snowboard(id, snowboards)
  if (current_snowboard.in_stock)
    current_status = "In Stock"
  else
    current_status = "Out of Stock"
  end
  puts "The #{current_snowboard.brand} #{current_snowboard.model} is #{current_status}."
  puts "Is this item still in stock? (yes or no)"
  status = gets.chomp
  if (status == "yes")
    current_snowboard.in_stock = (true)
  elsif (status == "no")
    current_snowboard.in_stock = (false)
  else
    puts "Update Error. Please enter true or flase"
  end
end

def create_snowboard
  puts "Brand: "
  new_brand = gets.chomp
  puts "Model"
  new_model = gets.chomp
  puts "Year: "
  new_year = gets.chomp
  puts "Price: "
  new_price = gets.chomp
  new_snowboard = Snowboard.new((@record_count + 1), new_brand, new_model, new_year, new_price, true)
  @record_count += 1
  return new_snowboard
end

puts make_table(snowboards)

# Program Loop. Until the input from user is q the program ask for input
# to interact with the data
input = ""
until input == "q"
  puts "[c]reate    [r]ead    [u]pdate    [d]elete    [q]uit"
  input = gets.chomp
  if input == "c" # c is for create
    snowboards << create_snowboard
  elsif input == "r" # r is for read
    puts "Snowboard id: "
    id = gets.chomp.to_i
    p get_snowboard(id, snowboards)
  elsif input == "u" # U is for update
    update_snowboard(snowboards)
  elsif input == "d" # d is for delete
    delete_snowboard(snowboards)
    puts "delete"
  elsif input == "q"
    puts "quit"
  else
    puts "I don't know that input try again"
  end
  puts make_table(snowboards)
end
