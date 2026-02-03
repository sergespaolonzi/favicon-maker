require "minitest/autorun"
require "favicon_maker/txtlib"

class TxtlibTest < Minitest::Test
  def test_make_html
    expected_html = <<~EOF
        <link rel="icon" type="image/png" href="/favicon-96x96.png" sizes="96x96" />
        <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
        <link rel="shortcut icon" href="/favicon.ico" />
        <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />
        <meta name=\"apple-mobile-web-app-title\" content=\"#{site_name}\" />
        <link rel="manifest" href="/site.webmanifest" />
    EOF
    input = ""
    outputdir = "A", "B"
    Txtlib::make_html(input, outputdir)
    result = ""
    output_file = File.join("head.html", output_filename)
    File.open(output_file) do |file|
      result = file.read
    end
    assert_equal result, expected_html
  end

  def test_make_webappmanifest
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
    outputdir = "A", "B"
    Txtlib::make_webappmanifest(input, outputdir)
    result = ""
    output_file = File.join("site.webmanifest", output_filename)
    File.open(output_file) do |file|
      result = file.read
    end
    assert_equal result, expected_json
  end
end