describe JSONAPI::Serializer do
  let(:post){ create :post }
  let(:serializer_params){ {} }
  let(:serializer){ MyApp::PostSerializer.new(post, serializer_params) }
  describe 'include_linkages' do
    subject{ serializer.include_linkages }
    it 'returns an array from string input' do
      serializer_params[:include_linkages] = '  comments, something.else , '
      subject.should eq %w[comments something.else]
    end
  end

  describe '#direct_children_includes' do
    subject{ serializer.direct_children_includes }
    it 'returns the direct children of include_linkages' do
      serializer_params[:include_linkages] = %w[comments something.else extra.nesting extra.double.nesting]
      subject.should eq %w[comments something extra]
    end
  end

  describe '#include_linkages_for_child' do
    it 'returns the nesting specs for a specific child' do
      serializer_params[:include_linkages] = %w[comments something.else extra extra.nesting extra.double.nesting]
      serializer.include_linkages_for_child('extra').should eq %w[nesting double.nesting]
    end
  end
end
