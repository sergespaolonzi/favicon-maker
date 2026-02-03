require "minitest/autorun"
require "favicon_maker/txtlib"

class TxtlibTest < Minitest::Test
  def test_make_html
    input, outputdir = "A", "B"
    assert_equal ["A", "B"],
      Cmd.run(input, outputdir)
  end

  def test_make_webappmanifest
    input, outputdir = "A", "B"
    assert_equal ["A", "B"],
      Cmd.run(input, outputdir)
  end
end