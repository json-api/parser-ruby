require 'json/api'

class AcceptanceIdStyleTest < MiniTest::Unit::TestCase
  def test_homepage
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

  def test_singular_resources
    json = <<-JSON
{
  "posts": [{
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_multiple_resources
    json = <<-JSON
{
  "posts": [{
  },{
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_attributes
    json = <<-JSON
{
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase"
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_relationships
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

  def test_many_to_many_relationships
    json = <<-JSON
{
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase",
    "links": {
      "comments": [ "5", "12", "17", "20" ]
    }
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_to_one_relationships
    json = <<-JSON
{
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase",
    "links": {
      "author": "17"
    }
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_compound_documents
    json = <<-JSON
{
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase",
    "links": {
      "author": "9"
    }
  }],
  "linked": {
    "people": [{
      "id": "9",
      "name": "@d2h"
    }]
  }
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end
end

class AcceptanceUrlStyleTest < MiniTest::Unit::TestCase
  def test_homepage
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

  def test_singular_resource
    json = <<-JSON
{
  "posts": [{
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_collections
    json = <<-JSON
{
  "posts": [{
  }, {
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_id
    json = <<-JSON
{
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase"
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_relationships
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

  def test_many_to_many
    json = <<-JSON
{
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase",
    "links": {
      "comments": "http://example.com/posts/1/comments"
    }
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_to_one
    json = <<-JSON
{
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase",
    "links": {
      "author": "http://example.com/people/17"
    }
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_url_template
    json = <<-JSON
{
  "links": {
    "posts.comments": "http://example.com/posts/{posts.id}/comments"
  },
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase"
  }, {
    "id": "2",
    "title": "The Parley Letter"
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_url_template_2
    json = <<-JSON
{
  "links": {
    "posts.comments": "http://example.com/comments/{posts.comments}"
  },
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase",
    "links": {
      "comments": [ "1", "2", "3", "4" ]
    }
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_url_template_3
    json = <<-JSON
{
  "links": {
    "posts.author": "http://example.com/people/{posts.author}"
  },
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase",
    "links": {
      "author": "12"
    }
  }, {
    "id": "2",
    "title": "The Parley Letter",
    "links": {
      "author": "12"
    }
  }, {
    "id": "3",
    "title": "Dependency Injection is Not a Virtue",
    "links": {
      "author": "12"
    }
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_compound_documents
    json = <<-JSON
{
  "links": {
    "posts.author": {
      "href": "http://example.com/people/{posts.author}",
      "type": "people"
    },
    "posts.comments": {
      "href": "http://example.com/comments/{posts.comments}",
      "type": "comments"
    }
  },
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase",
    "links": {
      "author": "9",
      "comments": [ "1", "2", "3" ]
    }}, {
    "id": "2",
    "title": "The Parley Letter",
    "links": {
      "author": "9",
      "comments": [ "4", "5" ]
   }}, {
    "id": "1",
    "title": "Dependency Injection is Not a Virtue",
    "links": {
      "author": "9",
      "comments": [ "6" ]
    }
  }],
  "linked": {
    "people": [{
      "id": "9",
      "name": "@d2h"
    }],
    "comments": [{
      "id": "1",
      "body": "Mmmmmakase"
    }, {
      "id": "2",
      "body": "I prefer unagi"
    }, {
      "id": "3",
      "body": "What's Omakase?"
    }, {
      "id": "4",
      "body": "Parley is a discussion, especially one between enemies"
    }, {
      "id": "5",
      "body": "The parsley letter"
    }, {
      "id": "6",
      "body": "Dependency Injection is Not a Vice"
    }]
  }
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_compound_documents_2
    json = <<-JSON
{
  "links": {
    "posts.author": {
      "href": "http://example.com/people/{posts.author}",
      "type": "people"
    },
    "posts.comments": {
      "href": "http://example.com/comments/{posts.comments}",
      "type": "comments"
    }
  },
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase",
    "links": {
      "author": "9",
      "comments": [ "1", "2", "3" ]
    }}, {
    "id": "2",
    "title": "The Parley Letter",
    "links": {
      "author": "9",
      "comments": [ "4", "5" ]
   }}, {
    "id": "1",
    "title": "Dependency Injection is Not a Virtue",
    "links": {
      "author": "9",
      "comments": [ "6" ]
    }
  }],
  "linked": {
    "people": [{
      "id": "9",
      "name": "@d2h"
    }],
    "comments": [{
      "href": "http://example.com/comments/1",
      "id": "1",
      "body": "Mmmmmakase"
    }, {
      "href": "http://example.com/comments/2",
      "id": "2",
      "body": "I prefer unagi"
    }, {
      "href": "http://example.com/comments/3",
      "id": "3",
      "body": "What's Omakase?"
    }, {
      "href": "http://example.com/comments/4",
      "id": "4",
      "body": "Parley is a discussion, especially one between enemies"
    }, {
      "href": "http://example.com/comments/5",
      "id": "5",
      "body": "The parsley letter"
    }, {
      "href": "http://example.com/comments/6",
      "id": "6",
      "body": "Dependency Injection is Not a Vice"
    }]
  }
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end
end

class AcceptanceResponseTest < MiniTest::Unit::TestCase
  def test_created
    json = <<-JSON
{
  "photos": [{
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "href": "http://example.com/photos/12",
    "title": "Ember Hamster",
    "src": "http://example.com/images/productivity.png"
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_patch_1
    json = <<-JSON
{
  "photos": [{
    "id": "1",
    "title": "Productivity",
    "src": "http://example.com/productivity.png"
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_patch_2
    json = <<-JSON
{
  "links": {
    "photos.author": "http://example.com/people/{photos.author}"
  },
  "photos": [{
    "id": "1",
    "href": "http://example.com/photos/1",
    "title": "Hamster",
    "src": "images/hamster.png",
    "links": {
      "author": "1"
    }
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end

  def test_patch_3
    json = <<-JSON
{
  "links": {
    "photos.comments": "http://example.com/comments/{photos.comments}"
  },
  "photos": [{
    "id": "1",
    "href": "http://example.com/photos/1",
    "title": "Hamster",
    "src": "images/hamster.png",
    "links": {
      "comments": [ "1", "5", "12", "17" ]
    }
  }]
}
JSON

    assert JSON::Api.parse(json), "failed to parse"
  end
end
