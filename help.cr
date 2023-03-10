require "option_parser"

filename = ""

OptionParser.parse do |parser|
  parser.banner = "Welcome to The PO 2Invoice CLI App!"

  parser.on "-v", "--version", "Show version" do
    puts "version 1.0"
    exit
  end
  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
  parser.on "-f", "--file FILENAME", "Specify the PO file to convert" do |value|
    filename = value
  end
  parser.missing_option do |option_flag|
    STDERR.puts "ERROR: #{option_flag} is missing something."
    STDERR.puts ""
    STDERR.puts parser
    exit(1)
  end
  parser.invalid_option do |option_flag|
    STDERR.puts "ERROR: #{option_flag} is not a valid option."
    STDERR.puts parser
    exit(1)
  end
end

unless filename.empty?
  STDERR.puts ""
  puts "Converting #{filename} to Invoice..."
end
