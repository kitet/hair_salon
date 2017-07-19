require 'spec_helper'

RSpec.describe Stylist do
 context 'do test to check functionality of stylist class' do
  #test to check if save method saves to the database
  it 'saves the stylist to the database' do
   stylist1=Stylist.new(name: 'Michelle', id:nil)
   stylist1.save
   expect(Stylist.all).to eq([stylist1])
  end

  #test to check if database is empty at first
  it 'checks if stylist database is empty at first' do
    expect(Stylist.all).to eq([])
  end

  #update method to check if it updates stylist object representation in the db
  it 'updates the object attributes in the database' do
    stylist1=Stylist.new(name: 'Stylist A', id:nil)
    stylist1.save
    stylist1.update(name: "Stylist B")
    expect(stylist1.sname).to eq 'Stylist B'
  end

  #test on the delete method
    #breaks the association befoore the deletiin is done
    #delete the object from the database
    it 'deletes the stylist from the database' do
     s1=Stylist.new(name: 'stylist a', id:nil)
     s1.save
     c1=Client.new(name: 'client a', id:nil, phone: 3873883)
     c1.save
     s1.add_client(c1.id)
     s1.delete
     expect(Stylist.all).to eq []
    end
 end
end