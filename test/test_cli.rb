require "minitest/autorun"
require "favicon_maker/cli"

class CliTest < Minitest::Test
  def test_cli
    input, outputdir = "A", "B"
    assert_equal ["A", "B"],
      Cli.cli(input, outputdir)
  end

end