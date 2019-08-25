# CepBrasil

This gem was created to make my applications tests more easy. I will update soon and I'll be happy if you want to help me


## Installation

To start using, just add this line to your application's Gemfile:

```ruby
gem 'cep_brasil'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cep_brasil

## Usage

In your application, require using require 'cep_brasil' 

Example of usage:

```
require 'cep_brasil'


#Generates a Random CEP

CepBrasil::Random.generate_formated #=> "010050-101"

#Create a address object by pass a CEP and content type, ex: json, xml

endereco = CepBrasil::Address::Generate.new('01001001', 'json') #=> "Object"
endereco.cep #=> "010050-101"
endereco.logradouro #=> "Praça da Sé"

## The random generates not necessarily generates a valid cep, it´s good to use for a tests
## The Address object with valid cep build a valid address

```

## Development

Any suggestions or help are welcome :)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cep_brasil. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

