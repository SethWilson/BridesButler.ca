require 'rubygems'
require 'haml'

template = File.read('bb-test.haml')

haml_engine = Haml::Engine.new(template).to_html(Object.new, { :title => "BridesButler.ca", :content => "%p A test paragraph...in HAML!", :pagename => "about", :image_prefix => 'buttmunch'} )

 

puts haml_engine