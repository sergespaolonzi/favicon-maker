require 'mini_magick'


module FaviconMaker
   def self.run(input, outputdir)
      current_folder = File.expand_path('../lib', File.dirname(__FILE__))
      input_file = File.join(current_folder, "image.png")
      output_dir = File.join(current_folder, "output.png")
      make_ico(input_file, output_dir)
      make_pngs(input_file, output_dir)
      make_svg(input_file, output_dir)
      make_html(output_dir)
      make_webappmanifest(output_dir)
   end
end
