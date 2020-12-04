# Приложение ASKme

ASKme - это подобие глобальной социальной сети "ASKfm", где Вы можете открыто или анонимно спросить человека о том, что Вас интересует. Также, другие люди тоже смогут задавать Вам вопросы. 

Протестировать приложение можно перейдя сюда: [Heroku](http://bigask.herokuapp.com/)

*программа создана при прохождении курса [Хороший Программист](https://goodprogrammer.ru/)

# Установка и Запуск
Для корректной работы приложения, необходимо установить:
* Ruby 2.6.6
* Ruby on Rails 6.0.3.2
```$ git clone git@github.com:bekushka/askme.git
$ cd ./askme
$ bundle install
$ yarn install
$ rails db:setup
$ rails db:seed
$ rails s
```

Ваше приложение находится по адресу http://localhost:3000/
