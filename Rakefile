require 'rake'

class Replacer
  def self.replace(filepath, regexp, *args, &block)
    content = File.read(filepath).gsub(regexp, *args, &block)
    File.open(filepath, 'wb') { |file| file.write(content) }
  end
end

desc "cleam up old app code in gadget in case there is any for testing"
task :clean_up do
  replace_pattern = /<script id='mainApp' type="text\/javascript">(.*)<\/script>/
  
  Replacer.replace( './src/gadget.html', replace_pattern, '')
end

desc "build coffee src and merge into index.html"

task :build_and_merge do

  #build app from coffee source and pull header for slamming in later
  sh "coffee -c ./src/sobs_pins.coffee"
  header = File.open('./src/gadget.html').readlines.join()
  js_string = File.open('./src/sobs_pins.js').readlines.join()
  script_string = %{<script id='mainApp' type='text\/javascript'>\n#{js_string}\n</script>}
  

  #build final html gadget
  sobs_pin_gadget = File.open('index.html', "w") do |file|
    file.puts header
    file.puts script_string
  end

end