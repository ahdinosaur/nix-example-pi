# nix-example-pi

A small NixOS example to cross-compile for Raspberry Pi

_Currently failing and I'm not sure why._

## Test

```shell
nix build --impure .#vm.test
```

See [log.txt](./log.txt) for log output.
