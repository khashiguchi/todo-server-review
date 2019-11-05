require 'rails_helper'

RSpec.describe Todo, type: :model do

  before(:each) do
    @todo = create(:todo)
  end

  describe "title" do
    it "is presence" do
      expect(@todo).to be_valid
    end

    it "is not presence" do
      @todo.title= ""
      expect(@todo).to be_invalid
    end
    
    it "has 100 characters" do
      @todo.title = "a" * 100
      expect(@todo).to be_valid
    end

    it "has 101 characters" do
        @todo.title= "a" * 101
        expect(@todo).to be_invalid
    end
    
  end

  describe "detail" do
    it "has 1000 characters" do
      @todo.detail="a"*1000
      expect(@todo).to be_valid
    end

    it "has 1001 characters" do
      @todo.detail="a"*1001
      expect(@todo).to be_invalid
    end
  end
  
end
