class Kall < Formula
  desc "Run commands across multiple projects in parallel"
  homepage "https://github.com/kanetran29/kall"
  url "https://github.com/kanetran29/kall/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "9f7562130bcfd82f09bd756f8c5effeb1ad28b8643bc909eb2ae3d37f3052dca"
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
