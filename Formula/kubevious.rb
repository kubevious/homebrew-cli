require "language/node"

class Kubevious < Formula
  desc "Detects and prevents Kubernetes misconfigurations and violations"
  homepage "https://github.com/kubevious/kubevious"
  url "https://registry.npmjs.org/kubevious/-/kubevious-1.0.20.tgz"
  sha256 "04331ac58518ce646e039203ee3c825e5b1f9e326df0dee9c7a6df7335650304"
  license "Apache-2.0"

  livecheck do
    url "https://registry.npmjs.org/kubevious/latest"
    regex(/["']version["']:\s*?["']([^"']+)["']/i)
  end

  depends_on "node@14"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    (bin/"kubevious").write_env_script libexec/"bin/kubevious", PATH: "#{Formula["node@14"].opt_bin}:$PATH"
  end

  test do
    assert_match "v1.0.20",
      shell_output("#{bin}/kubevious --version")
  end
end
