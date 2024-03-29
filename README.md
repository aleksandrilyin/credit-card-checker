# Credit Card Checker

Credit card checking service.

## Description

Before a credit card is submitted to a financial institution, it generally makes sense to run some simple reality checks on the number. The numbers are a good length and it's common to make minor transcription errors when the card is not scanned directly.

The first check people often do is to validate that the card matches a known pattern from one of the accepted card providers. Some of these patterns are:

| Card Type  | Begins With | Number Length |
| ---------- | ----------- | ------------- |
| AMEX       | 34 or 37    | 15            |
| Discover   | 6011        | 16            |
| MasterCard | 51-55       | 16            |
| Visa       | 4           | 13 or 16      |

All of these card types also generate numbers such that they can be validated by the Luhn algorithm, so that's the second check systems usually try. The steps are:

1. Starting with the next to last digit and continuing with every other digit going back to the beginning of the card, double the digit
2. Sum all doubled and untouched digits in the number
3. If that total is a multiple of 10, the number is valid

For example, given the card number `4408 0412 3456 7893`:

```
Step 1: 8 4 0 8 0 4 2 2 6 4 10 6 14 8 18 3
Step 2: 8+4+0+8+0+4+2+2+6+4+1+0+6+1+4+8+1+8+3 = 70
Step 3: 70 % 10 == 0
```

Thus that card is valid.

Let's try one more, `4417 1234 5678 9112`:

```
Step 1: 8 4 2 7 2 2 6 4 10 6 14 8 18 1 2 2
Step 2: 8+4+2+7+2+2+6+4+1+0+6+1+4+8+1+8+1+2+2 = 69
Step 3: 69 % 10 != 0
```

That card is not valid.

## Features

* Checking the card matches a known pattern from one of the accepted card providers (AMEX, Discover, MasterCard, Visa or Unknown)
* Checking indication of whether the card passes the Luhn algorithm (Valid/Invalid)

## Requirements

* Ruby 2.6.5 or newer

## Installing

[Download ZIP](https://github.com/aleksandrilyin/credit-card-checker/archive/refs/heads/master.zip) or clone the repository locally:
```sh
$ git clone git@github.com:aleksandrilyin/credit-card-checker.git
```

## Usage

Go to the directory:
```sh
$ cd credit-card-checker/
```

Run the program:
```sh
$ ruby credit_card_checker.rb <card_number>
```

### Usage Examples

```sh
$ ruby credit_card_checker.rb 4408 0412 3456 7893
Card Type: Visa
Card Validity: Valid
```

```sh
$ ruby credit_card_checker.rb 4417 1234 5678 9112
Card Type: Visa
Card Validity: Invalid
```

## Testing

Install the Bundler gem:
```sh
$ gem install bundler
```

Install the dependencies:
```sh
$ bundle
```

Run the tests:
```sh
$ bundle exec rspec
```

## Localization `README.md`

* [Russian README](README-ru.md)
