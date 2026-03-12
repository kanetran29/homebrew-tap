class Kall < Formula
  desc "Run commands across multiple projects in parallel"
  homepage "https://github.com/kanetran29/kall"
  url "https://github.com/kanetran29/kall/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "5b9297ff5d6b8ea150901b4317b43060db23b15e7e9d8c677853b48a3508c384"
  license "MIT"

  def install
    bin.install "bin/kall"
    man1.install "man/kall.1"
    bash_completion.install "completions/kall.bash" => "kall"
    zsh_completion.install "completions/_kall"
  end

  test do
    assert_match "kall #{version}", shell_output("#{bin}/kall --version")
  end
end
