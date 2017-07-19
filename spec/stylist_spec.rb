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
 end
end