class FasdClvv < Formula
  desc "CLI tool for quick access to files and directories"
  homepage "https://github.com/clvv/fasd"
  url "https://github.com/clvv/fasd/archive/refs/tags/1.0.1.tar.gz"
  sha256 "88efdfbbed8df408699a14fa6c567450bf86480f5ff3dde42d0b3e1dee731f65"
  license "MIT"
  head "https://github.com/clvv/fasd.git", branch: "master"

  bottle do
    root_url "https://github.com/letuanhai/homebrew-tap/releases/download/fasd-clvv-1.0.1"
    sha256 cellar: :any_skip_relocation, ventura:      "bdb2d29aa930ef614864069ad364d61e9428b6414d3bd5f21def24342c4fbfb8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "70d5a6db64a51fcaa6c229583b8821b42695757d391d92b094231268e620eec9"
  end

  def install
    bin.install "fasd"
    man1.install "fasd.1"
  end

  test do
    system "#{bin}/fasd", "--init", "auto"
  end
end
