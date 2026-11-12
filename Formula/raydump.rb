class Raydump < Formula
  include Language::Node::Shebang

  desc "Decrypt Raycast exports and extract them as Markdown and JSON"
  homepage "https://github.com/bixvongoeler/raydump"
  url "https://github.com/bixvongoeler/raydump/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "d4411f223347d345682bfaa9729c9d877e4c7d9f8340b6e685f041634d0d3a3a"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "bin", "src", "package.json"
    rewrite_shebang detected_node_shebang, libexec/"bin/raydump.js"
    bin.install_symlink libexec/"bin/raydump.js" => "raydump"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/raydump --version").strip
    (testpath/"not-an-export.rayconfig").write "hello"
    assert_match "does not look like a Raycast export", shell_output("#{bin}/raydump not-an-export.rayconfig 2>&1", 1)
  end
end
