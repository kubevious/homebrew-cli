require "language/node"

class Kubevious < Formula
  desc "Detects and prevent Kubernetes misconfigurations and violations"
  homepage "https://github.com/kubevious/kubevious"
  url "https://github.com/kubevious/cli-releases/raw/main/v1.0.20/npm/kubevious.tgz"
  license "Apache-2.0"
  sha256 "86942cf385472e2650b9032894643dd3cc1557575aa9336120ffec08ecf391f0"

  depends_on "node@14"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"kubevious", "--version"
  end
end
