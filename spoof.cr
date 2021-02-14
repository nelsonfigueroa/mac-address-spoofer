require "option_parser"
require "colorize"
require "random/secure"

def generate_mac_address
  mac_address = [] of String
  random_bytes = Random::Secure.hex(6).split("")

  random_bytes.each_with_index do |_char, index|
    mac_address << random_bytes[index] + random_bytes[index + 1] if index.even?
  end

  mac_address.join(':')
end

def set_mac_address(interface, mac_address)
  puts `sudo ifconfig #{interface} ether #{mac_address}`
  return
end

begin
  OptionParser.parse do |parser|
    parser.banner = "Usage: macspoof [flag] [network interface]\nExample: macspoof -i en0"

    parser.on "-i INTERFACE", "--interface INTERFACE" do |interface|
      mac_address = generate_mac_address
      puts "Randomizing MAC address."
      puts mac_address
      set_mac_address(interface, mac_address)
      puts "Done!"
      exit
    end

    parser.on "-h", "--help" do
      puts parser
      exit
    end

    parser.invalid_option do |flag|
      STDERR.puts "ERROR: #{flag} is not a valid option."
      STDERR.puts parser
      exit(1)
    end
  end
rescue exception
  if ARGV[0] == "-i"
    puts "No interface specified."
    exit(1)
  end
end
