require File.dirname(__FILE__) + "/spec_helper"

describe "WebScour" do
  before do
    @data = <<-HTML
<html>
  <head>
    <title>Hello World</title>
  </head>
  <body>
    <p>This is testing.</p>

    <ul>
      <li>A</li>
      <li>B</li>
      <li>C</li>
    </ul>
  </body>
</html>
    HTML
    FakeWeb.register_uri(:any, "http://www.example.com", :body => @data)
  end

  it "should have data" do
    @data.should_not be_nil
    @data.should_not be_empty
  end

  it "should have content" do
    resp = Faraday.get "http://www.example.com/"
    resp.body.should_not be_empty
    resp.body.should == @data
  end

  it "should have title" do
    html = WebScour.parse("http://www.example.com/") do
      
      element :title
      
      element './/body/p' => :body

      elements :ul => :list do
        element:li => :text
      end

    end

    html.title.should == "Hello World"
    html.body.should =~ /This is testing\./
    html.list.should be_kind_of(Array)
    html.list.first.text.should == "A"
  end
end
