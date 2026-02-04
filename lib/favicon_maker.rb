require "favicon_maker/imagelib"
require "favicon_maker/txtlib"


module FaviconMaker
   def self.run(input, output_dir)

      name = "App"
      short_name = "App" 
      theme_color = "#ffffff"
      background_color = "#ffffff"

      Imagelib.make_ico(input, output_dir)
      Imagelib.make_pngs(input, output_dir)
      Imagelib.make_svg(input, output_dir)
      Txtlib.make_html(name, output_dir)



      Txtlib.make_webappmanifest(name, short_name, theme_color, background_color, output_dir)
   end
end
