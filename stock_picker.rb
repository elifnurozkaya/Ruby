def stock_picker(array)
  min = 0;
  profit = 0
  best_days = [0,0]
  array.each_with_index do |buy_value,buy_day|
    array[buy_day..-1].each_with_index do |sell_value,sell_day|
      if (sell_value - buy_value) > profit
        profit = sell_value - buy_value
        best_days = [buy_day,sell_day]
      end
    end
  end
  return best_days
end


stock_picker([17,3,6,9,15,8,6,1,10])