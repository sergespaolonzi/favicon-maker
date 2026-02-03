require "favicon_maker/imagelib"
require "favicon_maker/txtlib"


module FaviconMaker
   def run(input, outputdir)
      
      current_folder = File.expand_path('../lib', File.dirname(__FILE__))
      input_file = File.join(current_folder, "image.png")
      output_dir = File.join(current_folder, "output.png")
      
      Imagelib::make_ico(input_file, output_dir)
      Imagelib::make_pngs(input_file, output_dir)
      Imagelib::make_svg(input_file, output_dir)
      Txtlib::make_html(output_dir)


      name = "App"
      short_name = "App" 
      theme_color = "#ffffff"
      background_color = "#ffffff"
      Txtlib::make_webappmanifest(name, short_name, theme_color, background_color, output_dir)
   end
end
