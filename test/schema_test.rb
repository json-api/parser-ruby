require 'json/api'

class SchemaTest < MiniTest::Unit::TestCase
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
end
