describe JSONAPI::Serializer do
  let(:post){ create :post }
  let(:serializer_params){ {} }
  let(:serializer){ MyApp::PostSerializer.new(post, serializer_params) }
  context "single object" do
    it "infers based on the object" do
      expect( described_class ).to receive(:serialize_primary).with instance_of(MyApp::PostSerializer), anything
      described_class.serialize post
    end

    it "uses the calling class if serialize is called on the class" do
      expect( described_class ).to receive(:serialize_primary).with instance_of(MyApp::LongCommentSerializer), anything
      MyApp::LongCommentSerializer.serialize post
    end
  end

  context "array" do
    it "infers based on the object inside the array" do
      expect( described_class ).to receive(:serialize_primary).with instance_of(MyApp::PostSerializer), anything
      described_class.serialize [post], is_collection: true
    end
  end
end
