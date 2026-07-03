VERSION = "0.1.1"

class Lsef < Formula
  desc "Rust-based file listing tool inspired by ls"
  homepage "https://github.com/Takayuki-Todo/lsef"
  version VERSION
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Takayuki-Todo/lsef/releases/download/v#{VERSION}/lsef-#{VERSION}_darwin_amd64.tar.gz"
    sha256 "6e0a4223c5d76bc9f9dadeb9ec75822e909e1e2d6f472adc114fea35cd563761"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Takayuki-Todo/lsef/releases/download/v#{VERSION}/lsef-#{VERSION}_darwin_arm64.tar.gz"
    sha256 "f0eec2c2cc4f17668855e32849f3cbb9136ec1eb53f48d88df3c6d07c4851044"
  end

def install
  bin.install "lsef"
  bash_completion.install "completions/bash/lsef"
  zsh_completion.install "completions/zsh/_lsef"
  fish_completion.install "completions/fish/lsef" => "lsef.fish"
end

  test do
    system "#{bin}/lsef", "--help"
  end
end