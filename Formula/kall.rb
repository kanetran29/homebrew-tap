class Kall < Formula
  desc "Run commands across multiple projects in parallel"
  homepage "https://github.com/kanetran29/kall"
  url "https://github.com/kanetran29/kall/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f814684b2e3abff92a0c0ed3279c9b2f4d74cebb0d8c5616763ad14b9a1b8386"
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
