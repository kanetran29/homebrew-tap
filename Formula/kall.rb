class Kall < Formula
  desc "Run commands across multiple projects in parallel"
  homepage "https://github.com/kanetran29/kall"
  url "https://github.com/kanetran29/kall/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "7f50b9b9a83dee8e2063bec275213f636013c2500d7c1f7e6929a183e187ddca"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/kall"
    man1.install "man/kall.1"

    generate_completions_from_executable(bin/"kall", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kall --version")
  end
end
