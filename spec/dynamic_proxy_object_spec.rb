describe JSONAPI::DynamicProxyObject do
  it 'should delegate methods to target and cache results' do
    target = double('target')
    expect(target).to receive(:foo).and_return('bar')
    expect(target).to receive(:foo).with(param1: '1', param2: 2).and_return('bar2')

    proxy = JSONAPI::DynamicProxyObject.new(target)
    expect(proxy.foo).to eq('bar')
    expect(proxy.foo).to eq('bar')
    expect(proxy.foo(param1: '1', param2: 2)).to eq('bar2')
    expect(proxy.foo(param1: '1', param2: 2)).to eq('bar2')
  end
end