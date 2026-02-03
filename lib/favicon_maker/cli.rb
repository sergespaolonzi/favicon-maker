require 'optparse'

module Cli
  def self.cli(args)
    options = {}
    parser = OptionParser.new
    parser.on('--input AAA', 'Input image.') do |value|
      options[:input] = value
    end
    parser.on('--outputdir AAA', 'Output directory.') do |value|
      options[:outputdir] = value
    end
    parser.parse(args)

    required_options = [:input, :outputdir]
    missing_options = required_options - options.keys
    unless missing_options.empty?
      fail "Missing required options: #{missing_options}"
    end
    return options
  end

end