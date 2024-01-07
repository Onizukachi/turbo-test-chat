first_user = User.create(email: 'dark_sao@mail.ru', password: 'password', password_confirmation: 'password')
second_user = User.create(email: 'onizuka@mail.ru', password: 'password', password_confirmation: 'password')
third_user = User.create(email: 'hikaru@mail.ru', password: 'password', password_confirmation: 'password')

Room.create(name: 'Games')
Room.create(name: 'Books')
