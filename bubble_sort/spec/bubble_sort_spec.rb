require './bubble_sort.rb'

describe BubbleSort do
    before(:all) do 
        @bubble_sort = BubbleSort.new
    end

    context "When testing the BubbleSort class" do 

        it "should work with a descending input array when we call the bubble_sort method" do
            output = @bubble_sort.bubble_sort([5,4,3,2,1])
            expect(output).to eq [1,2,3,4,5]
        end

        it "should work with a randomized input array when we call the bubble_sort method" do
            output = @bubble_sort.bubble_sort([4,3,78,2,0,2])
            expect(output).to eq [0,2,2,3,4,78]
        end
        
        it "should work with a randomized input array including negatives when we call the bubble_sort method" do
            output = @bubble_sort.bubble_sort([-10,10,100,0,0,-100])
            expect(output).to eq [-100,-10,0,0,10,100]
        end
        
    end
end

