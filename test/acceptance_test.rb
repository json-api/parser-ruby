require 'json/api'

class AcceptanceTest < MiniTest::Unit::TestCase
  def test_homepage_id_style
    json = <<-JSON
{
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase",
    "links": {
      "author": "9",
      "comments": [ "5", "12", "17", "20" ]
    }
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_homepage_url_style
    json = <<-JSON
{
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase",
    "links": {
      "author": "http://example.com/people/1",
      "comments": "http://example.com/comments/5,12,17,20"
    }
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end
end
