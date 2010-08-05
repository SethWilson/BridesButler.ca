require 'yaml'
require 'pp'

class SimpleTemplate < Hash
	
	def initialize(webpage_data, filehandler='')
	  page_title = webpage_data["title"]
	  
	  @template_top = <<End_of_Template
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link type="text/css" rel="stylesheet" href="bridesbutler.css">
	<title>#{page_title}</title>

</head>

<body>

	<div id="mainpanel">
		<div id="headerpanel">

		</div>
		<div id="contactinfopanel">
			<div id="contactinfocontent">
				<strong>905.516.9060 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info@bridesbutler.ca</strong>
			</div>

		</div>
		<div id="navmenu">
			<ul class="nav">
				<li><a href="about.html">about</a></li>
				<li><a href="weddings.html">weddings</a></li>
				<li><a href="http://bridesbutler.ca/gallery.html">gallery</a></li>
				<li><a href="http://bridesbutler.blogspot.com/">blog</a></li>
				<li><a href="events.html">events</a></li>
				<li><a href="friends.html">friends</a></li>
			</ul>
			<div id="buttons">
			    <a class="nodeco" href="http://twitter.com/bridesbutlerw"><img class="nodeco" src="images/twittericon-small.png" /></a>
			    <a class="nodeco" href="http://www.facebook.com/pages/Hamilton-ON/The-Brides-Butler-Wedding-Event-Planning/223115771167"><img class="nodeco" src="images/facebookicon-small.png" /></a>
			</div>
		</div>
    		
End_of_Template

  @template_bottom = <<End_of_Template
	
	</div>

</body>
</html>

End_of_Template

	  # merge the file data with the newly created hash
    self.merge!(webpage_data["divs"])


    #display as HTML
    self.save_as_html(filehandler) {|k,v| "<div id=\"#{k}\">#{v.gsub(/\|/,":")}</div>"}
	  
  end
	
	
	def display_as_html
		
		output_string = @template_top
		
		self.each { |k,v|
			output_string << yield(k,v)
		}
		
		output_string << @template_bottom
		
		return output_string
		
	end
	
	def save_as_html(filehandler)
		
		
		filehandler.write @template_top
		
		self.each { |k,v|
			filehandler.write(yield(k,v))
		}
		
		filehandler.write @template_bottom
		
	end
	

	
end




