require 'capybara/rspec'
require './app'
Capybara.app=Sinatra::Application
set(:show_exceptions, false)

describe('owner ',{:type=>:feature}) do
	it 'home shows button to ' do
		visit '/'
		click_link 'Go to Owner Section'
		expect(page.current_path).to eq '/owner'
	end
end