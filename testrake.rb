require 'yaml'
require 'SimpleTemplate'


def load_template_data(page_name)
  #load the YAML file with all the data
  website_data = open("#{File.dirname(__FILE__)}/bridesbutler_data.yaml") { |f| YAML.load(f) }
  return website_data[page_name]
end

File.open("tester.html", "w+") do |f|
  
 # f.write(SimpleTemplate.new(load_template_data("about.html"),f))
  out = SimpleTemplate.new(load_template_data("about.html"))
  puts #{out}
end
