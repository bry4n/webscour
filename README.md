WebScour
=======

*WebScour* is a little DSL web scraping tool.

    require 'webscour'
    
    blog = WebScour.parse('http://example.com') do
      element :title
    end
    
    blog.title
    #=> "Hello World"


[See Nibbler][http://github.com/mislav/nibbler] for `element` examples.

