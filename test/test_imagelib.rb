require "minitest/autorun"
require "favicon_maker/imagelib"
require 'fileutils'
require 'mini_magick'


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

    formats = {
      :favicon_96 => ["favicon-96x96.png", 96],
      :apple_touch => ["apple-touch-icon.png", 180],
      :web_app_manifest_192 => ["web-app-manifest-192x192.png", 192],
      :web_app_manifest_512 => ["web-app-manifest-512x512.png", 512]
    }
    
    formats.each do |key, value|
        output_filename = value[0]
        dimension = value[1]
        output_file = File.join(output_dir, output_filename)
        image = MiniMagick::Image.open(output_file)
        assert image.type == "PNG"
        assert image.width == dimension
        assert image.height == dimension
    end
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

    formats = {
      :favicon_96 => ["favicon-96x96.png", 96],
      :apple_touch => ["apple-touch-icon.png", 180],
      :web_app_manifest_192 => ["web-app-manifest-192x192.png", 192],
      :web_app_manifest_512 => ["web-app-manifest-512x512.png", 512]
    }
    
    formats.each do |key, value|
        output_filename = value[0]
        dimension = value[1]
        output_file = File.join(output_dir, output_filename)
        image = MiniMagick::Image.open(output_file)
        assert image.type == "PNG"
        assert image.width == dimension
        assert image.height == dimension
    end
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