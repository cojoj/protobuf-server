require 'csv'
require 'faker'

def random_account(id, name)
    accountName = name
    balance = 12999.56
    availableFunds = 9876.12
    iban = Faker::Bank.iban
    currency = "EUR"
    owner = Faker::Name.name
    ownerAddress = Faker::Address.street_address  + ", " + Faker::Address.city + " " + Faker::Address.zip + ", " + Faker::Address.country
    return [id, accountName, balance, availableFunds, iban, currency, owner, ownerAddress]
end

def random_transaction(id, date_offset)
    now = Date.today
    transactionType = rand(0..1)
    transactionDate = now - date_offset
    bookingDate = Faker::Date.between(transactionDate, transactionDate + 3)
    principalDisposal = Faker::Name.name
    orderingCustomer = Faker::Name.name
    beneficiary = Faker::Name.name
    beneficiaryAccount = Faker::Bank.iban
    details = Faker::Lorem.sentence
    amount = Faker::Commerce.price
    return [id, transactionType, transactionDate, bookingDate, principalDisposal, orderingCustomer, beneficiary, beneficiaryAccount, details, amount]
end


CSV.open("../Resources/accounts.csv", "w", :col_sep => ";") do |csv|
    csv << random_account(1, "Main account")
    csv << random_account(2, "Second account")
end

date_offset = 0

CSV.open("../Resources/transactions_1.csv", "w", :col_sep => ";") do |csv|
    (0..1000).each do |i|
        offset = 1000000
        csv << random_transaction(offset - i, date_offset)
        if i % 20 == 0
            date_offset += 1
        end
    end
end

date_offset = 0

CSV.open("../Resources/transactions_2.csv", "w", :col_sep => ";") do |csv|
    (0..10000).each do |i|
        offset = 2000000
        csv << random_transaction(offset - i, date_offset)
        if i % 20 == 0
            date_offset += 1
        end
    end
end


