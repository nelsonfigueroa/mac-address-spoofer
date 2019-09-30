# Built using Ruby 2.6.3

require 'securerandom'

# used for generating full mac addresses
def generate_random_mac_address
  mac_address = []
  random_bytes = SecureRandom.hex(6).split('')

  random_bytes.each_with_index do |char, index|
    if index.even?
      mac_address << random_bytes[index] + random_bytes[index + 1]
    end
  end

  mac_address.join(":")
end

# used for generating last 3 bytes of mac address
def generate_three_bytes
  three_bytes = []
  random_bytes = SecureRandom.hex(3).split('')

  random_bytes.each_with_index do |char, index|
    if index.even?
      three_bytes << random_bytes[index] + random_bytes[index + 1]
    end
  end

  three_bytes.join(":")
end

# get interface as a command line parameter
if ARGV.empty?
  puts "Please specify an interface"
  exit(1)
else
  interface = ARGV[0]
end

# get manufacturer (optional) as a command line parameter
manufacturer = ARGV[1]

# generate mac address based on manufacturer (if specified)
case manufacturer
when 'dell'
  mac_address = "f8:cA:b8:" + generate_three_bytes()
when 'hp'
  mac_address = "f0:62:81:" + generate_three_bytes()
when 'apple'
  mac_address = "fc:fc:48:" + generate_three_bytes()
when 'lenovo'
  mac_address = "ec:89:f5:" + generate_three_bytes()
when 'asus'
  mac_address = "e0:cb:4e:" + generate_three_bytes()
when 'toshiba'
  mac_address = "f4:64:5d:" + generate_three_bytes()
when 'acer'
  mac_address = "c0:98:79:" + generate_three_bytes()
else
  mac_address = generate_random_mac_address()
end

if RUBY_PLATFORM =~ /linux/
  puts "OS: Linux"
  puts "Randomizing MAC address...#{mac_address}"
  puts `sudo ifconfig #{interface} ether #{mac_address}`
elsif RUBY_PLATFORM =~ /darwin/
  puts "OS: MacOS"
  puts "Randomizing MAC address...#{mac_address}"
  puts `sudo ifconfig #{interface} ether #{mac_address}`
else
  puts "Sorry, your operating system is not currently supported."
end
