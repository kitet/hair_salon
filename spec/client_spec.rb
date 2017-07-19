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
  #test to check update of name of the client
  it 'updates the name of the client'  do
    client1=Client.new(name: 'Patrick Lumumba', id: nil, phone: 747487)
    client1.save
    client1.update(name: 'P.L.O Lumumba')
    expect(client1.cname).to eq ('P.L.O Lumumba')
  end

  #test to on delete method
  it 'deletes client from the database' do
    client1=Client.new(name: 'Patrick Lumumba', id: nil, phone: 747487)
    client1.save
    client2=Client.new(name: 'Mambo Mbotela', id: nil, phone: 75757245)
    client2.save
    client1.delete
    expect(Client.all).to eq [client2]
  end
 end
end