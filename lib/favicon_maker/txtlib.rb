require 'json'

module Txtlib
   def make_html(site_name, output_dir)
      output_filename = "head.html"
      output_file = File.join(output_dir, output_filename)
      File.open(output_file, "a") do |file|
         file.puts '<link rel="icon" type="image/png" href="/favicon-96x96.png" sizes="96x96" />'
         file.puts '<link rel="icon" type="image/svg+xml" href="/favicon.svg" />'
         file.puts '<link rel="shortcut icon" href="/favicon.ico" />'
         file.puts '<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />'
         file.puts "<meta name=\"apple-mobile-web-app-title\" content=\"#{site_name}\" />" 
         file.puts '<link rel="manifest" href="/site.webmanifest" />'
      end
   end

   def make_webappmanifest(name, short_name, theme_color, background_color, output_dir)
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
      pretty_json_output = JSON.pretty_generate(manifest)
      output_filename = "site.webmanifest"
      output_file = File.join(output_dir, output_filename)
      File.open(output_file, "w") do |file|
         file.write pretty_json_output
      end
   end
end