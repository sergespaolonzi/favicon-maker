require "minitest/autorun"
require "favicon_maker/imagelib"
require 'fileutils'


class ImagelibTest < Minitest::Test
  def test_make_ico_from_png
    script_directory = __dir__
    input_file = File.join(script_directory, "assets", "icon.png")
    output_dir = File.join(script_directory, "tmp", "png")
    FileUtils.mkdir_p output_dir unless File.directory?(output_dir)
    Imagelib.make_ico(input_file, output_dir)

    output_file = File.join(output_dir, "favicon.ico")
    expected_file = File.join(script_directory, "assets", "from-png", "favicon.ico")
    assert FileUtils.identical?(output_file, expected_file)
  end

  def test_make_pngs_from_png
    script_directory = __dir__
    input_file = File.join(script_directory, "assets", "icon.png")
    output_dir = File.join(script_directory, "tmp", "png")
    FileUtils.mkdir_p output_dir unless File.directory?(output_dir)
    Imagelib.make_pngs(input_file, output_dir)

    output_file = File.join(output_dir, "apple-touch-icon.png")
    expected_file = File.join(script_directory, "assets", "from-png", "apple-touch-icon.png")
    assert FileUtils.identical?(output_file, expected_file)
    output_file = File.join(output_dir, "favicon-96x96.png")
    expected_file = File.join(script_directory, "assets", "from-png", "favicon-96x96.png")
    assert FileUtils.identical?(output_file, expected_file)
    output_file = File.join(output_dir, "web-app-manifest-192x192.png")
    expected_file = File.join(script_directory, "assets", "from-png", "web-app-manifest-192x192.png")
    assert FileUtils.identical?(output_file, expected_file)
    output_file = File.join(output_dir, "web-app-manifest-512x512.png")
    expected_file = File.join(script_directory, "assets", "from-png", "web-app-manifest-512x512.png")
    assert FileUtils.identical?(output_file, expected_file)
  end

  def test_make_svg_from_png
    script_directory = __dir__
    input_file = File.join(script_directory, "assets", "icon.png")
    output_dir = File.join(script_directory, "tmp", "png")
    FileUtils.mkdir_p output_dir unless File.directory?(output_dir)
    Imagelib.make_svg(input_file, output_dir)

    output_file = File.join(output_dir, "favicon.svg")
    expected_file = File.join(script_directory, "assets", "from-png", "favicon.svg")
    assert FileUtils.identical?(output_file, expected_file)
  end

  def test_make_ico_from_svg
    script_directory = __dir__
    input_file = File.join(script_directory, "assets", "icon.svg")
    output_dir = File.join(script_directory, "tmp", "svg")
    FileUtils.mkdir_p output_dir unless File.directory?(output_dir)
    Imagelib.make_ico(input_file, output_dir)


    output_file = File.join(output_dir, "favicon.ico")
    expected_file = File.join(script_directory, "assets", "from-svg", "favicon.ico")
    assert FileUtils.identical?(output_file, expected_file)

  end

  def test_make_pngs_from_svg
    script_directory = __dir__
    input_file = File.join(script_directory, "assets", "icon.svg")
    output_dir = File.join(script_directory, "tmp", "svg")
    FileUtils.mkdir_p output_dir unless File.directory?(output_dir)
    Imagelib.make_pngs(input_file, output_dir)


    output_file = File.join(output_dir, "apple-touch-icon.png")
    expected_file = File.join(script_directory, "assets", "from-svg", "apple-touch-icon.png")
    assert FileUtils.identical?(output_file, expected_file)
    output_file = File.join(output_dir, "favicon-96x96.png")
    expected_file = File.join(script_directory, "assets", "from-svg", "favicon-96x96.png")
    assert FileUtils.identical?(output_file, expected_file)
    output_file = File.join(output_dir, "web-app-manifest-192x192.png")
    expected_file = File.join(script_directory, "assets", "from-svg", "web-app-manifest-192x192.png")
    assert FileUtils.identical?(output_file, expected_file)
    output_file = File.join(output_dir, "web-app-manifest-512x512.png")
    expected_file = File.join(script_directory, "assets", "from-svg", "web-app-manifest-512x512.png")
    assert FileUtils.identical?(output_file, expected_file)
  end

  def test_make_svg_from_svg
    script_directory = __dir__
    input_file = File.join(script_directory, "assets", "icon.svg")
    output_dir = File.join(script_directory, "tmp", "svg")
    FileUtils.mkdir_p output_dir unless File.directory?(output_dir)
    Imagelib.make_svg(input_file, output_dir)


    output_file = File.join(output_dir, "favicon.svg")
    expected_file = File.join(script_directory, "assets", "from-svg", "favicon.svg")
    assert FileUtils.identical?(output_file, expected_file)
  end
end