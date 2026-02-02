require 'mini_magick'


module FaviconMaker
   def self.run(argv = ARGV)
      parser = OptionParser.new
      parser.on('--input-raster AAA', 'Raster input file to process.') do |value|
         p value
      end
      parser.on('--input-svg AAA', 'Raster SVG file to process.') do |value|
         p value
      end
      parser.on('--outputdir AAA', 'Output directory.') do |value|
         p value
      end
      options = {}
      parser.parse!(into: options)
      #????????????
      required_options = [:input-raster, :outputdir]
      missing_options = required_options - options.keys
      unless missing_options.empty?
         fail "Missing required options: #{missing_options}"
      end
   end



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

   def make_svg(output_dir)
      p ""
   end


   def make_html(output_dir)
   end

   def make_webappmanifest(output_dir)
   end

end
