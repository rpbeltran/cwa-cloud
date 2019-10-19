require_relative './rails_helper.rb'
Dir["../app/controllers/*.rb"].each {|file| require file }

describe 'Story Controller' do
    describe '#new' do
      it 'should be defined' do
        expect { recieve() }.not_to raise_error
      end
    end
end