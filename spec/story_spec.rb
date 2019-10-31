require_relative './rails_helper.rb'
Dir["../app/controllers/*.rb"].each {|file| require file }

describe 'Story Controller' do
    describe '#index' do
      it 'should be defined' do
        expect { index() }.not_to raise_error
      end
    end
end