class Plainrouter < Formula
  desc "Command-line interface for the PlainRouter Signals Conversion API"
  homepage "https://plainrouter.com"
  url "https://registry.npmjs.org/@plainrouter/cli/-/cli-0.5.0.tgz"
  sha256 "3e45735fbcbae675464b54d95667d3207c1f0a18d23aca921f7e4a15f918a335"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_equal "0.5.0", shell_output("#{bin}/plainrouter --version").strip
    assert_match "PlainRouter Signals API", shell_output("#{bin}/plainrouter --help")
  end
end
