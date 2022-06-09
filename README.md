# Pavo

![Banner](./images/banner.png)

🦚 A textual algorithm that calculates the similarity of two strings.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     pavo:
       github: hammerhai/pavo
   ```

2. Run `shards install`

## Usage

```crystal
require "pavo"
```

Pavo can be used in one line:

```crystal
Pavo.similarity("Hello", "world") # Outputs 0.2
```

## Contributing

1. Fork it (<https://github.com/hammerhai/pavo/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am '✨ Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Nathan](https://github.com/hammerhai) - creator and maintainer
