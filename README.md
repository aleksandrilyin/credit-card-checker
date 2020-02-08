# Credit card checker

Сервис проверки кредитных карт. Решение [тестового задания](https://github.com/aristofun/webdevdao/blob/master/test_assignments/credit_card_checker.md) на позицию Ruby on Rails разработчика.

## Функции

- Проверка соответствия карты известному шаблону одного из принятых поставщиков карт (AMEX, Discover, MasterCard, Visa или Неизвестно)
- Проверка признака соответствия карты [алгоритму Луна](https://ru.wikibooks.org/wiki/Реализации_алгоритмов/Алгоритм_Луна) (Действительный/Недействительный)

## Технологии

- Ruby 2.6.5

## Запуск

1. Клонируйте локально: `git clone git@github.com:aleksandrilyin/credit-card-checker.git`
2. Перейдите в директорию: `cd credit-card-checker`
3. Запустите программу: `ruby credit-card-checker.rb <номер карты>`

Для успешного запуска вам нужно установить Ruby 2.x.
