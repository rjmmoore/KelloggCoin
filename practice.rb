# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

blockchain = [
  { "from_user" => nil, "to_user" => "ben", "amount" => 20000 },
  { "from_user" => nil, "to_user" => "brian", "amount" => 20000 },
  { "from_user" => "ben", "to_user" => "evan", "amount" => 9000 },
  { "from_user" => "brian", "to_user" => "anthony", "amount" => 7000 },
  { "from_user" => "evan", "to_user" => "anthony", "amount" => 400 },
  { "from_user" => "ben", "to_user" => "anthony", "amount" => 1500 },
  { "from_user" => "anthony", "to_user" => "ben", "amount" => 4500 },
  { "from_user" => "anthony", "to_user" => "evan", "amount" => 1750 }
]

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650


wallets = []

for i in 0...blockchain.length
  from_user = blockchain[i]["from_user"]
  to_user = blockchain[i]["to_user"]

  found_from = false
  found_to = false

  for j in 0...wallets.length
    if wallets[j]["user"] == from_user
      found_from = true
    end
    if wallets[j]["user"] == to_user
      found_to = true
    end
  end

  wallets << { "user" => from_user, "balance" => 0 } if from_user && !found_from
  wallets << { "user" => to_user, "balance" => 0 } if !found_to
end

for i in 0...blockchain.length
  from_user = blockchain[i]["from_user"]
  to_user = blockchain[i]["to_user"]
  amount = blockchain[i]["amount"]

  if from_user
    for j in 0...wallets.length
      if wallets[j]["user"] == from_user
        wallets[j]["balance"] -= amount
        break
      end
    end
  end

  for j in 0...wallets.length
    if wallets[j]["user"] == to_user
      wallets[j]["balance"] += amount
      break
    end
  end
end

puts "Wallet Balances:"
for i in 0...wallets.length
  puts "#{wallets[i]['user']}: #{wallets[i]['balance']} Kelloggcoins"
end
