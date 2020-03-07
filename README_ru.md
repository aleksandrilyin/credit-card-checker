# Сервис проверки кредитных карт

## Описание

Решение [тестового задания](https://github.com/aristofun/webdevdao/blob/master/test_assignments/credit_card_checker.md) на позицию Ruby on Rails разработчика.

Использована [реализация алгоритма Луна](https://ru.wikibooks.org/wiki/Реализации_алгоритмов/Алгоритм_Луна).

### Функции

- Проверка соответствия карты известному шаблону одного из принятых поставщиков карт (AMEX, Discover, MasterCard, Visa или Неизвестно)
- Проверка признака соответствия карты алгоритму Луна (Действительный/Недействительный)

## Требования

- Ruby 2.5.0 или новее

## Установка

[Скачайте ZIP](https://github.com/aleksandrilyin/credit-card-checker/archive/master.zip) или клонируйте локально:
```console
$ git clone git@github.com:aleksandrilyin/credit-card-checker.git
```

## Использование

Перейдите в директорию:
```console
$ cd credit-card-checker
```

Запустите программу:
```console
$ ruby credit-card-checker.rb <номер карты>
```

Небольшой пример использования:
```console
$ ruby credit-card-checker.rb 4408 0412 3456 7893
Card type: Visa.
That card is valid.
$ ruby credit-card-checker.rb 4417 1234 5678 9112
Card type: Visa.
That card is not valid.
```
