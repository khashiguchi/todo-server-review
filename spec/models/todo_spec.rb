require 'rails_helper'

RSpec.describe Todo, type: :model do

  before(:each) do
    @todo = create(:todo)
  end

  describe "title" do
    it "is valid" do
      expect(@todo).to be_valid
    end

    context "is not present," do
      before{@todo.title= ""}
      it "is invalid" do
        expect(@todo).to be_invalid
      end
    end
    
    context "has 100 characters," do
      before{@todo.title = "a" * 100}
      it "is valid" do
        expect(@todo).to be_valid
      end
    end

    context "has 101 characters," do
      before{@todo.title= "a" * 101}
      it "is invalid" do
        expect(@todo).to be_invalid
      end
    end
  end

  describe "detail" do
    context "has 1000characters," do
      before {@todo.detail="a"*1000}
      it "is valid" do
        expect(@todo).to be_valid
      end
    end

    context "has 1001 characters" do
      before{@todo.detail="a"*1001}
      it "is invalid" do
        expect(@todo).to be_invalid
      end
    end
  end

end
