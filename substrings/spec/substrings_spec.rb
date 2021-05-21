require './substrings.rb'

describe Substrings do
    before(:all) do 
        @substrings = Substrings.new
        @dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    end

    context "When testing the Substrings class" do 

        it "should work with a single word string when we call the substrings method" do 
            output = @substrings.substrings("below", @dictionary)
            correct_output = { "below" => 1, "low" => 1 }
            expect(output).to eq correct_output
        end

        it "should work with a multiple word string when we call the substrings method" do 
            output = @substrings.substrings("Howdy partner, sit down! How's it going?", @dictionary)
            correct_output = { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
            expect(output).to eq correct_output
        end

    end
end
