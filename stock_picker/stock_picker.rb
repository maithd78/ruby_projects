def stock_picker(stocks)
    max_profit = 0
    max_profit_days = []

    stocks.each_with_index do |buy, buy_day|
        stocks.each_with_index do |sell, sell_day|
            if sell_day > buy_day
                profit = sell - buy
                if profit > max_profit
                    max_profit = profit
                    max_profit_days = [buy_day, sell_day]
                end
            end
        end
    end
    p max_profit_days
end

stock_picker([17,3,6,9,15,8,6,1,10])

# loop through the array with each element and send the 