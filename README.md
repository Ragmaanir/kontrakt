# kontrakt

Kontrakt provides two macros to implement very simple design-by-contract style checks.

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  kontrakt:
    github: ragmaanir/kontrakt
```


## Usage


```crystal
require "kontrakt"

include Kontrakt

precondition(1 == 5) # raises
postcondition(3 == 3 && true != false) # passes
```


## Contributing

1. Fork it ( https://github.com/ragmaanir/kontrakt/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [ragmaanir](https://github.com/ragmaanir) ragmaanir - creator, maintainer
