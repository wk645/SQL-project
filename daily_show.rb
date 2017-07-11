require 'csv'
daily_show = CSV.read('daily_show_guests.csv', { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})

hash_data = daily_show.map {|d| d.to_h}
puts hash_data
# daily_show.each do |row|
# 	puts row
# end