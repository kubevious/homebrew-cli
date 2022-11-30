require "language/node"

class Kubevious < Formula
  desc "Detects and prevent Kubernetes misconfigurations and violations"
  homepage "https://github.com/kubevious/kubevious"
  url "https://github.com/kubevious/cli-releases/raw/main/v1.0.20/npm/kubevious.tgz"
  sha256 "86942cf385472e2650b9032894643dd3cc1557575aa9336120ffec08ecf391f0"
  license "Apache-2.0"

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
