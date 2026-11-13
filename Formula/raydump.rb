class Raydump < Formula
  include Language::Node::Shebang

  desc "Decrypt Raycast exports and extract them as Markdown and JSON"
  homepage "https://github.com/bixvongoeler/raydump"
  url "https://github.com/bixvongoeler/raydump/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "caa304f17f02138d4dc0013d1271ecd3059e1a926ad95a0585d4cb0d679bbc7d"
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
