class BubbleSort
    # Takes in an array and returns an array sorted using bubble sort
    def bubble_sort(array)
        swapOccurred = true
        n = array.length
        
        while swapOccurred
            swapOccurred = false
            for i in 0...n-1  # exclusive
                # swap neighbors if the one on the left is larger than the one on the right
                if array[i] > array[i+1]
                    temp = array[i]
                    array[i] = array[i+1]
                    array[i+1] = temp
                    swapOccurred = true
                end
            end
            # Optimize by observing that the n-th pass finds the n-th largest element and
            # puts it into its final place.
            # So, the inner loop can avoid looking at the last n − 1 items when running for
            # the n-th time.
            n -= 1
        end
        return array
    end
end
