require 'rails_helper'

describe Astronaut, type: :model do
  before(:each) do
    test_data
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe "model methods" do
    it '#avg_age' do
      expect(Astronaut.avg_age).to eq(48)
    end
  end

  describe "instance methods" do
    describe "#missions" do
      it 'lists missions in alpha order for each astronaut' do
        expect(@tim.missions).to eq([@mission1, @mission2])
        expect(@al.missions).to eq([@mission1, @mission2, @mission3, @mission4])
      end
    end
  end
end
