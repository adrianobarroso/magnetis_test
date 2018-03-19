puts "Creating seed with two users with bank account"

user = User.create(email: 'test@magnetis.com',
                    password: '123123', password_confirmation: '123123')

user2 = User.create(email: 'test2@magnetis.com',
                    password: '123123', password_confirmation: '123123')

BankAccount.create(savings: 1000, user: user)
BankAccount.create(savings: 2000, user: user2)
