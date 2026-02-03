require "minitest/autorun"
require "favicon_maker/cli"

class CliTest < Minitest::Test
  def test_cli
    args = ["--input", "A", "--outputdir", "B"]
    result = Cli.cli(args)
    assert_equal ["A", "B"], result.values
  end

end