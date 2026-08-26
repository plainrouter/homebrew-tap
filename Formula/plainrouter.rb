class Plainrouter < Formula
  desc "Command-line interface for the PlainRouter Signals Conversion API"
  homepage "https://plainrouter.com"
  url "https://registry.npmjs.org/@plainrouter/cli/-/cli-0.5.0.tgz"
  sha256 "3e45735fbcbae675464b54d95667d3207c1f0a18d23aca921f7e4a15f918a335"
  license "Apache-2.0"

  depends_on "node"

  resource "sdk" do
    url "https://registry.npmjs.org/@plainrouter/sdk/-/sdk-0.5.0.tgz"
    sha256 "f5f21c9d3d8fe5954f21fd860c3d77c96f6fa9ed0bbecdef13f9978cf84c2066"
  end

  def install
    resource("sdk").stage do
      source = Pathname("package").directory? ? Pathname("package") : Pathname.pwd
      (buildpath/"vendor/plainrouter-sdk").install source.children
    end

    package_json = JSON.parse((buildpath/"package.json").read)
    package_json.fetch("dependencies")["@plainrouter/sdk"] = "file:vendor/plainrouter-sdk"
    package_json.fetch("dependencies")["zod"] = "4.4.3"
    package_json.fetch("files") << "vendor"
    (buildpath/"package.json").atomic_write(JSON.pretty_generate(package_json))

    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_equal "0.5.0", shell_output("#{bin}/plainrouter --version").strip
    assert_match "Plainrouter Signals API", shell_output("#{bin}/plainrouter --help")
  end
end
