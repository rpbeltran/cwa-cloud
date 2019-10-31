require_relative './rails_helper.rb'
require_relative '../app/controllers/logins_controller'

#Dir["../app/controllers/*.rb"].each {|file| require file }

describe 'logins_controller' do
    describe '#sum' do 
      it 'should be defined' do
        expect { sum([1, 3, 4]) }.not_to raise_error
      end
  
      it 'returns correct sum [20 points]', points: 20 do
        expect(sum([1, 2, 3, 4, 5])).to be_a_kind_of Integer
        expect(sum([1, 2, 3, 4, 5])).to eq(15)
        expect(sum([1, 2, 3, 4, -5])).to eq(5)
        expect(sum([1, 2, 3, 4, -5, 5, -100])).to eq(-90)
      end
  
      it 'works on the empty array [10 points]', points: 10 do
        expect { sum([]) }.not_to raise_error
        expect(sum([])).to be_zero
      end
    end
    describe '#receive' do
      it 'should be defined' do
        #expect { receive(test) }.not_to raise_error
        expect(receive).to respond_to(:receive) 
      end
    end
end
