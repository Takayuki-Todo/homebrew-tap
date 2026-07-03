VERSION = "0.1.0"

class Lsef < Formula
  desc "Rust-based file listing tool inspired by ls"
  homepage "https://github.com/Takayuki-Todo/lsef"
  version VERSION
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Takayuki-Todo/lsef/releases/download/v#{VERSION}/lsef-#{VERSION}_darwin_amd64.tar.gz"
    sha256 "ae16f0822e51ed26090578a532d29c79fe6f226a42edef195bfbb31fb87ecf8e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Takayuki-Todo/lsef/releases/download/v#{VERSION}/lsef-#{VERSION}_darwin_arm64.tar.gz"
    sha256 "b00895e5b0379fa02f0e816112bc96ff1d9219d9854cefd6005777231292920a"
  end

  def install
    bin.install "lsef"
    bash_completion.install "completions/bash/lsef"
    zsh_completion.install "completions/zsh/_lsef"
    fish_completion.install "completions/fish/lsef"
  end

  test do
    system "#{bin}/lsef", "--help"
  end
end