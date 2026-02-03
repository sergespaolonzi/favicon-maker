module Cmd
  def self.cli(args)
    options = {}
    parser = OptionParser.new
    parser.on('--input AAA', 'Required argument via short name') do |value|
      options[:input] = value
    end
    parser.on('--outputdir AAA', 'Required argument via long name') do |value|
      options[:outputdir] = value
    end

    parser.parse!(args)

    required_options = [:input, :outputdir]
    missing_options = required_options - options.keys
    unless missing_options.empty?
      fail "Missing required options: #{missing_options}"
    end
    options
  end

end