VERSION = "0.3.0"

class Lsef < Formula
  desc "Rust-based file listing tool inspired by ls"
  homepage "https://github.com/Takayuki-Todo/lsef"
  version VERSION
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Takayuki-Todo/lsef/releases/download/v#{VERSION}/lsef-#{VERSION}-x86_64-apple-darwin.tar.gz"
    sha256 "6ba4fa45c7d405e2f5891c9372d68a224355b7198aa7dfa323bf81b2081250e8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Takayuki-Todo/lsef/releases/download/v#{VERSION}/lsef-#{VERSION}-aarch64-apple-darwin.tar.gz"
    sha256 "495631920b148cc8963213edfcf7753c06128e2e4a4f0358f6d7366f3d3ecb30"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Takayuki-Todo/lsef/releases/download/v#{VERSION}/lsef-#{VERSION}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4cbc37e8425b6372e443bb3e994a19bb8016aa3a8d423fbfd700269455cf107c"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Takayuki-Todo/lsef/releases/download/v#{VERSION}/lsef-#{VERSION}-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e21b44e917271336d0575b052d96b2ac7c55322adcae1c3f5c84d40c703e22ee"
  end

  def install
    bin.install "lsef"
    bash_completion.install "completions/bash/lsef"
    zsh_completion.install "completions/zsh/_lsef"
    fish_completion.install "completions/fish/lsef" => "lsef.fish"
  end

  test do
    assert_match "lsef #{version}", shell_output("#{bin}/lsef --version")
  end
end
