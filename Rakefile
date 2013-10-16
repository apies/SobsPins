require 'rake'

class Replacer
  def self.replace(filepath, regexp, *args, &block)
    content = File.read(filepath).gsub(regexp, *args, &block)
    File.open(filepath, 'wb') { |file| file.write(content) }
  end
end

desc "compile coffee source to js"

task :clean_up do
  virgin_app_script = %{<script id='mainApp' type="text/javascript"></script>}
  replace_pattern = /<script id='mainApp' type="text\/javascript">(.*)<\/script>/
  
 #kill old app code
  Replacer.replace( './src/gadget.html', replace_pattern, '')
end

task :build_and_merge => :clean_up do
  sh "coffee -c ./src/sobs_pins.coffee"
  header = File.open('./src/gadget.html').readlines.join()
  js_string = File.open('./src/sobs_pins.js').readlines.join()
  script_string = %{<script id='mainApp' type='text\/javascript'>\n#{js_string}\n</script>}
  

  #make a test output string
  sobs_pin_gadget = File.open('index.html', "w") do |file|
    file.puts header
    file.puts script_string
  end

  # sobs_pin_gadget.puts script_string

  #Replacer.replace('./src/gadget.html', , %{<script type='text\/javascript'>\n#{js_string}\n</script>})
end