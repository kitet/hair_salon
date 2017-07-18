#code to execute rspec unit test and on methods on the client class
require 'spec_helper'

RSpec.describe Client do
 context 'testing client methods' do
    #test to check if save method works
  it 'saves client to the database' do
    client1=Client.new(name: 'Client A', id:nil, phone: 7474747)
    client1.save
    expect(Client.all[0].cname).to eq 'Client A'
  end
  #test to check if all returns empty when no item is added
  it 'all method should return empty at first' do
    expect(Client.all).to eq []
  end
 end
end