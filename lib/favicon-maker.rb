require 'mini_magick'

def main()
   current_folder = File.expand_path('../lib', File.dirname(__FILE__))
   input_file = File.join(current_folder, "image.png")
   output_dir = File.join(current_folder, "output.png")
   make_ico(input_file, output_dir)
   make_pngs(input_file, output_dir)
end

def make_ico(input_file, output_dir)
   output_filename = "favicon.ico"
   output_file = File.join(output_dir, output_filename)
   MiniMagick.convert do |convert|
      convert << input_file
      convert.background "transparent"
      convert.define "icon:auto-resize=48,32,16"
      convert << output_file
   end
end

def make_pngs(input_file, output_dir)
   # 96, 180, 192, 512
   formats = {
    :favicon_96 => ["favicon-96x96.png", "96x96!"],
    :apple_touch => ["apple-touch-icon.png", "180x180!"],
    :web_app_manifest_192 => ["web-app-manifest-192x192.png", "192x192!"],
    :web_app_manifest_512 => ["web-app-manifest-512x512.png", "512x512!"]
   }
   image = MiniMagick::Image.open(input_file)

   formats.each do |key, value|
    output_filename = value[0]
    dimensions = value[1]
    output_file = File.join(output_dir, output_filename)

    image.resize dimensions
    image.write output_file
   end
end

def make_svg(input_file)
  p ""
end

