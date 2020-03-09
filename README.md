# Credit card check service

## Description

The solution of the [test task](https://github.com/aristofun/webdevdao/blob/master/test_assignments/credit_card_checker.md) for the position of Ruby on Rails developer.

[The implementation of the Luhn algorithm](https://ru.wikibooks.org/wiki/Реализации_алгоритмов/Алгоритм_Луна) is used.

### Features

- Checking the card's compliance with the known template of one of the accepted card providers (AMEX, Discover, MasterCard, Visa or Unknown)
- Checking whether the card matches the Luhn algorithm (Valid/Invalid)

## Requirements

- Ruby 2.5.0 or newer

## Installation

[Download ZIP](https://github.com/aleksandrilyin/credit-card-checker/archive/master.zip) or clone locally:
```console
$ git clone git@github.com:aleksandrilyin/credit-card-checker.git
```

## Usage

Go to the directory:
```console
$ cd credit-card-checker
```

Run the program:
```console
$ ruby credit-card-checker.rb <номер карты>
```

A small usage example:
```console
$ ruby credit-card-checker.rb 4408 0412 3456 7893
Card type: Visa.
That card is valid.
$ ruby credit-card-checker.rb 4417 1234 5678 9112
Card type: Visa.
That card is not valid.
```

## Localization `README.md`

- [Russian README](README_ru.md)
