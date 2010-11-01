WebScour
=======

*WebScour* is a little DSL web scraping tool.

    require 'webscour'
    
    blog = WebScour.parse('http://example.com') do
      element :title
    end
    
    blog.title
    #=> "Hello World"


[See Nibbler][nibbler] for more `element` examples.

[nibbler]: http://github.com/mislav/nibbler
