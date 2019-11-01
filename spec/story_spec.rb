require_relative './rails_helper.rb'
#Dir["../app/controllers/*.rb"].each {|file| require file }
require_relative '../app/controllers/story_controller'


describe Story, :type => :model do 
  subject { described_class.new }
  
  it 'is valid with valid attributes' do
    subject.title = 'test'
    subject.firstname = 'test'
    subject.lastname = 'test'
    subject.file = 'test'
    expect(subject).to be_valid
  end
  
  it 'is not valid without a title' do
    subject.title = nil
    subject.firstname = 'test'
    subject.lastname = 'test'
    subject.file = 'test'    
    expect(subject).to_not be_valid
  end
  
  it 'is not valid without a firstname' do
    subject.title = 'test'
    subject.firstname = nil
    subject.lastname = 'test'
    subject.file = 'test'    
    expect(subject).to_not be_valid
  end
  it 'is not valid without a lastname' do
    subject.title = 'test'
    subject.firstname = 'test'
    subject.lastname = nil
    subject.file = 'test'    
    expect(subject).to_not be_valid
  end
  it 'is not valid without a file' do
    subject.title = 'test'
    subject.firstname = 'test'
    subject.lastname = 'test'
    subject.file = nil   
    expect(subject).to_not be_valid
  end
  it 'is valid without a genre' do
    subject.title = 'test'
    subject.firstname = 'test'
    subject.lastname = 'test'
    subject.file = 'test'
    subject.genre = nil
    expect(subject).to be_valid
  end
  it 'is valid without tags' do
    subject.title = 'test'
    subject.firstname = 'test'
    subject.lastname = 'test'
    subject.file = 'test'  
    subject.tags = []
    expect(subject).to be_valid
  end
end