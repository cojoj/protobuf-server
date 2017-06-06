require 'csv'
require 'forgery'
require 'faker'

CSV.open("../Resources/accounts.csv", "w", :col_sep => ";") do |csv|
    csv << [1, "Main account", 12999.56, 9876.12, Forgery('bank_account').iban, Forgery('currency').code, Forgery('name').full_name, Forgery('address').street_address  + ", " + Forgery('address').city + " " + Forgery('address').zip + ", " + Forgery('address').country]
    csv << [2, "Second account", 5672.22, 230.22, Forgery('bank_account').iban, Forgery('currency').code, Forgery('name').full_name, Forgery('address').street_address + ", " + Forgery('address').city + " " + Forgery('address').zip + ", " + Forgery('address').country]
end

CSV.open("../Resources/transactions_1.csv", "w", :col_sep => ";") do |csv|
    (0..1000).each do |i|
        title = Faker::Lorem.sentence
        csv << [i + 1000000, rand(0..1), Forgery('date').date, Forgery('date').date, Forgery('name').full_name, Forgery('name').full_name, Forgery('name').full_name, Forgery('bank_account').iban, title, Forgery('monetary').money]
    end
end

CSV.open("../Resources/transactions_2.csv", "w", :col_sep => ";") do |csv|
    (0..10000).each do |i|
        title = Faker::Lorem.sentence
        csv << [i + 2000000, rand(0..1), Forgery('date').date, Forgery('date').date, Forgery('name').full_name, Forgery('name').full_name, Forgery('name').full_name, Forgery('bank_account').iban, title, Forgery('monetary').money]
    end
end
