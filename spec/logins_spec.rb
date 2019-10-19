#require_relative '../app/controllers/logins_controller.rb'
require_relative './rails_helper.rb'
Dir["../app/controllers/*.rb"].each {|file| require file }

describe 'Logins Controller' do
    describe '#recieve' do
      it 'should be defined' do
        expect { recieve() }.not_to raise_error
      end
    end
end
