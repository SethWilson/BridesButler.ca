require 'yaml'
require 'SimpleTemplate'
require 'rake/clean'
require 'rubygems'
require 'ruby-growl'
require 'net/sftp'
require 'net/ftp'
require 'haml'


g = Growl.new "localhost", "ruby-growl", ["ruby-growl Notification"]

#REMOTE_PATH='/Applications/MAMP/htdocs/bridesbutler/'
#REMOTE_SERVER='192.168.1.107'
#REMOTE_LOGIN='sethwilson'
#REMOTE_PASSWORD='monger03'

REMOTE_PATH='public_html/'
REMOTE_SERVER='diznee.ipower.com'
REMOTE_LOGIN='sethmaster'
REMOTE_PASSWORD='dudeWTF!12345'

#TODO: Get the file list by performing a look at the YAML file and determining pages from that
html_files = FileList['index.html','friends.html', 'about.html', 'weddings.html', 'events.html', 'dayof.html', 'consultation.html', 'planning.html', 'why.html']
css_files = FileList['*.css']
image_files = FileList['images/*.jpg', 'images/*.png', 'images/*.gif']
text_files = FileList['*.xml', '*.txt']
js_files = FileList['javascripts/*.js']
php_files = FileList['*.php']

CLEAN.include(html_files)

def load_template_data(page_name)
  #load the YAML file with all the data
  website_data = open("#{File.dirname(__FILE__)}/bridesbutler_data.yaml") { |f| YAML.load(f) }
  return website_data[page_name]
end


def send_files(file_list)
  file_list.each do |target|
    send_file(target)
  end
  
end

def send_file(target)
  Net::FTP.open(REMOTE_SERVER) do |ftp|
      ftp.login(REMOTE_LOGIN, REMOTE_PASSWORD)
      ftp.chdir(REMOTE_PATH)
      ftp.putbinaryfile(target,target)
      outputs "Transfered #{target}"
    end
end

def send_file_securely(target)
  Net::SFTP.start(REMOTE_SERVER, REMOTE_LOGIN, :password => REMOTE_PASSWORD, :port => 2222) do |sftp|
     ssh.sftp.upload!(target, REMOTE_PATH + target)
      outputs "Transfered #{target}"        
    
  end
end

def outputs(output_string)
  
  puts output_string
  
end



desc "Build all pages for the Brides Butler website and deploy"
task :build_and_deploy_all_html => ["build_all", "deploy_html"] do

end


html_files.each do |target|
  template = File.read('bb-test.haml')
  file target => 'bridesbutler_data.yaml' do
    website_data = load_template_data(target)
    outputs "Built #{target} in each"
    File.open(target, "w+") do |f|
      haml_engine = Haml::Engine.new(template).to_html(Object.new, { :title => website_data["title"], 
                                                                     :content => website_data["pagecontent"], 
                                                                     :pagename => website_data["pagename"], 
                                                                     :image_prefix => website_data["image_prefix"]}) 
      f.write haml_engine
    end
  end
  desc "Build all pages for the Brides Butler website locally"
  task :build_all => target
end


desc "Deploy all files for the Brides Butler website"
task :deploy_all => ['deploy_html', 'deploy_css', 'deploy_images', 'deploy_static', 'deploy_js', 'deploy_php'] do
 
end

desc "Deploy all static files for the Brides Butler website"
task :deploy_static => ['deploy_css', 'deploy_images', 'deploy_text', 'deploy_js', 'deploy_php'] do
 
end

desc "Build a specific page for the Brides Butler website and deploy"
task :build_and_deploy_this_page => 'build_this_page' do
  outputs "#{ENV["FILENAME"]}"
  Rake::Task[:deploy_this_page].invoke ENV["FILENAME"]
end


desc "Build a specific page for the Brides Butler website locally"
task :build_this_page => ENV["FILENAME"]


desc "Deploy a specific page for the Brides Butler website"
task :deploy_this_page, [:page] do |t, args|
      send_file(args.page)
end

desc "Deploy any and all HTML files"
task :deploy_html do
    send_files(html_files)
end

desc "Deploy any and all CSS files"
task :deploy_css do
    send_files(css_files)
end

desc "Deploy any and all image files"
task :deploy_images do
    send_files(image_files)
end

desc "Deploy any and all static files"
task :deploy_text do
    send_files(text_files)
end

desc "Deploy any and all javascript files"
task :deploy_js do
    send_files(js_files)
end

desc "Deploy any and all javascript files"
task :deploy_php do
    send_files(php_files)
end

desc "Build a sitemap based on files provided"
task :build_sitemap do
  
end

#desc "Builds the HTML file, using SimpleTemplate."
#file ENV["FILENAME"] => 'bridesbutler_data.yaml' do
#  g.notify "ruby-growl Notification", "BridesButler.ca Build", "Built #{ENV["FILENAME"]}"
#  File.open(ENV["FILENAME"], "w+") do |f|
#    SimpleTemplate.new(load_template_data(ENV["FILENAME"]),f)
#  end
#end

