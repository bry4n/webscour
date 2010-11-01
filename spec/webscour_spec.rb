require File.dirname(__FILE__) + "/spec_helper"

describe "WebScour" do
  before do
    @data = <<-HTML
<html>
  <head>
    <title>Hello World</title>
  </head>
  <body>
    <p>
      This is testing.
    </p>
  </body>
</html>
    HTML
    FakeWeb.register_uri(:any, "http://www.example.com", :body => @data)
  end

  it "should have data" do
    @data.should_not be_nil
  end

  it "should have content" do
    resp = Faraday.get "http://www.example.com/"
    resp.body.should_not be_nil
  end
  it "should have title" do
    html = WebScour.parse("http://www.example.com/") do
      element :title
    end
    html.title.should == "Hello World"
  end
end

__END__
<html>
<head>
<title>Hello World</title>
</head>
<body>
<p>
This is testing.
  </p>
</body>
</html>
