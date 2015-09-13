describe JSONAPI::Serializer do
  it "Includes meta information given to the serializer on top level" do
    post = create :post
    expect(described_class.serialize [post], is_collection: true, meta: {foo: 'bar'}).to eq(
      "data" => [{
        "id"=>"1",
        "type"=>"posts",
        "attributes"=>{
          "title"=>"Title for Post 1",
          "long-content"=>"Body for Post 1"
        }, "links"=> {
          "self"=>"/posts/1"
        }, "relationships"=>{
          "author"=>{
            "links"=>{
              "self"=>"/posts/1/relationships/author",
              "related"=>"/posts/1/author"
            }
          }, "long-comments"=>{
            "links"=>{
              "self"=>"/posts/1/relationships/long-comments",
              "related"=>"/posts/1/long-comments"
            }
          }
        }
      }],
      "meta" => {
        "foo" => 'bar'
      }
    )
  end
end
