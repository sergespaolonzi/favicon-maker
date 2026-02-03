require "minitest/autorun"
require "favicon_maker/txtlib"
require 'fileutils'

class TxtlibTest < Minitest::Test
  def test_make_html
    site_name = "App"
    expected_html = <<~EOF
        <link rel="icon" type="image/png" href="/favicon-96x96.png" sizes="96x96" />
        <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
        <link rel="shortcut icon" href="/favicon.ico" />
        <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />
        <meta name=\"apple-mobile-web-app-title\" content=\"#{site_name}\" />
        <link rel="manifest" href="/site.webmanifest" />
    EOF
    script_directory = __dir__
    output_dir = File.join(script_directory, "tmp", "html")
    FileUtils.mkdir_p output_dir unless File.directory?(output_dir)

    result = Txtlib.make_html(site_name, output_dir)
    output_file = File.join(output_dir, "head.html")
    File.open(output_file) do |file|
      result = file.read
    end
    assert_equal result, expected_html
  end

  def test_make_webappmanifest
    name = "App"
    short_name = "App" 
    theme_color = "#ffffff"
    background_color = "#ffffff"
    manifest = {
                "name"=>  name,
                "short_name"=>  short_name,
                "icons"=>  [
                    {
                      "src"=>  "/web-app-manifest-192x192.png",
                      "sizes"=>  "192x192",
                      "type"=>  "image/png",
                      "purpose"=>  "maskable"
                    },
                    {
                      "src"=>  "/web-app-manifest-512x512.png",
                      "sizes"=>  "512x512",
                      "type"=>  "image/png",
                      "purpose"=>  "maskable"
                    }
                ],
                "theme_color"=> theme_color,
                "background_color"=>  background_color,
                "display"=> "standalone"
                }
    expected_json = JSON.pretty_generate(manifest)
    script_directory = __dir__
    output_dir = File.join(script_directory, "tmp", "webmanifest")
    FileUtils.mkdir_p output_dir unless File.directory?(output_dir)

    result = Txtlib.make_webappmanifest(name, short_name, theme_color, background_color, output_dir)
    output_file = File.join(output_dir, "site.webmanifest")
    File.open(output_file) do |file|
      result = file.read
    end
    assert_equal result, expected_json
  end
end