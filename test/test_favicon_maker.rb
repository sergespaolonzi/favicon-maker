require "minitest/autorun"
require "favicon_maker"

class FaviconMakerTest < Minitest::Test
  def test_run
    input = ""
    outputdir = ""
   
    FaviconMaker::run(input, outputdir)

    assert_equal ["A", "B"],
      Cmd.run(input, outputdir)
  end
end