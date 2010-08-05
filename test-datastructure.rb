require 'yaml'

@pages = Hash.new

@divs = Hash.new
@divs["pagetitle"] = '<img src="images/about-header.png" />'
@divs["pagecontent"] = '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>'

@page1 = Hash.new

@page1["title"] = "Bridesbutler.ca"
@page1["divs"] = @divs
@page1["filename"] = "index.html"
@page1["meta-description"] = "A full service wedding planner"
@page1["meta-keywords"] = "wedding planner, weddings, wedding helper"

@pages["home"] = @page1

@page2 = Hash.new
@page2["title"] = "Bridesbutler.ca | about"
@page2["divs"] = @divs
@page2["filename"] = "about.html"
@page2["meta-description"] = "A full service wedding planner"
@page2["meta-keywords"] = "wedding planner, weddings, wedding helper"

@pages["about"] = @page2

puts @pages.to_yaml