class StockPicker
    # Takes in an array of stock prices, one for each hypothetical day, and
    # returns an array of days representing the best day to buy and the best day to sell
    # (i.e. to maximize profit or minimize loss)
    def stock_picker(prices_array)
        output = []
        day_pairs = []
        profits = []

        # O(n^2) time
        prices_array.each_with_index do |price1, i|
            prices_array.each_with_index do |price2, j|
                # need to buy before you can sell
                if i < j
                    # i, j, profit
                    day_pairs.push([i, j])
                    profits.push(price2 - price1)
                end
            end
        end

        # find the max profit
        max_profit_index = profits.each_with_index.max[1]
        output = day_pairs[max_profit_index]
        return output
    end

end
