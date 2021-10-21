# show nix-env
# show nix-shell
# nix-shell '<unstable>' -A go
with (import <nixpkgs> {});
mkShell {

  buildInputs = [
    git
    pandoc
    chromium
  ];

  shellHook = ''
    git clone https://github.com/hakimel/reveal.js.git
    pandoc -s -t revealjs ./nixpresi.md -o slides.html

    alias run="chromium ./slides.html"
    alias build="pandoc -s -t revealjs ./nixpresi.md -o slides.html"

    echo "Note: type 'run' to start presentation."
    echo "      type 'build' to rebuild presentation."
  '';

}
