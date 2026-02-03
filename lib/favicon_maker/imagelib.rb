require 'mini_magick'

module Imagelib
   def self.make_ico(input_file, output_dir)
      #convert icon.png -background transparent -define icon:auto-resize=48,32,16 favicon.ico
      output_filename = "favicon.ico"
      output_file = File.join(output_dir, output_filename)
      MiniMagick.convert do |convert|
         convert << input_file
         convert.background "transparent"
         convert.define "icon:auto-resize=48,32,16"
         convert << output_file
      end
   end

   def self.make_pngs(input_file, output_dir)
      # 96, 180, 192, 512
      formats = {
      :favicon_96 => ["favicon-96x96.png", "96x96"],
      :apple_touch => ["apple-touch-icon.png", "180x180"],
      :web_app_manifest_192 => ["web-app-manifest-192x192.png", "192x192"],
      :web_app_manifest_512 => ["web-app-manifest-512x512.png", "512x512"]
      }
      
      #convert -size 1024x1024 icon.svg icon.png
      formats.each do |key, value|
         output_filename = value[0]
         dimensions = value[1]
         output_file = File.join(output_dir, output_filename)
         MiniMagick.convert do |convert|
            convert.size dimensions
            convert << input_file
            convert << output_file
         end
      end
   end

   def make_svg(input_file, output_dir)
      output_filename = "favicon.svg"
      output_file = File.join(output_dir, output_filename)
      MiniMagick::Image.open(input_file) do |image|
         if image.format == "svg"
            image.write output_file
         else
            MiniMagick.convert do |convert|
               convert << input_file
               convert << output_file
            end
         end
      end
   end
end