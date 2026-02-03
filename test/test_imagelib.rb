require "minitest/autorun"
require "favicon_maker/imagelib"

class ImagelibTest < Minitest::Test
  def test_make_ico
    input, outputdir = "A", "B"
    assert_equal ["A", "B"],
      Cmd.run(input, outputdir)
  end

  def test_make_pngs
    input, outputdir = "A", "B"
    assert_equal ["A", "B"],
      Cmd.run(input, outputdir)
  end

  def test_make_svg
    input, outputdir = "A", "B"
    assert_equal ["A", "B"],
      Cmd.run(input, outputdir)
  end
end