build:
  nix build --impure .#vm.test

run: build
  ./result/bin/run-test-vm
