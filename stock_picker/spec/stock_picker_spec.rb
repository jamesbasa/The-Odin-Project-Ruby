require './stock_picker.rb'

describe StockPicker do
    before(:all) do 
        @stock_picker = StockPicker.new
    end

    context "When testing the StockPicker class" do 

        it "should work with a simple input of prices when we call the stock_picker method" do
            output = @stock_picker.stock_picker([4, 0, 3])
            expect(output).to eq [1,2] # for a profit of $3 - $0 == $3
        end

        it "should work with an input of multiple prices, where the highest price is 
            the first day, when we call the stock_picker method" do
            output = @stock_picker.stock_picker([17,3,6,9,15,8,6,1,10])
            expect(output).to eq [1,4] # for a profit of $15 - $3 == $12
        end

        it "should work with an input of only descending prices when we call the stock_picker method" do
            output = @stock_picker.stock_picker([200, 100, 0, -1, -200])
            expect(output).to eq [2,3] # for a profit of -$1 - 0 == -$1
        end
        
    end
end

