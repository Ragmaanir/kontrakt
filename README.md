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

Kontrakt.precondition(1 == 5) # raises
Kontrakt.postcondition(3 == 3 && true != false) # passes
```

To disable the conditions set DISABLE_CONTRACTS env var:

```crystal
DISABLE_CONTRACTS=1 crystal spec
```

## TODO

- output the values of the variables used
- evaluate partial expressions like power_assert.cr. maybe only show leaf-values, e.g. dont show `x && y`, just show `x` and `y`

## Contributing

1. Fork it ( https://github.com/ragmaanir/kontrakt/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [ragmaanir](https://github.com/ragmaanir) ragmaanir - creator, maintainer
