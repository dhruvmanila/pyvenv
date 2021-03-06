# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Pyvenv < Formula
  desc "Personal tool for managing Python virtual environments."
  homepage "https://github.com/dhruvmanila/pyvenv"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dhruvmanila/pyvenv/releases/download/v0.6.1/pyvenv-0.6.1-darwin-arm64.tar.gz"
      sha256 "4fc60a0121d4d05ff4e8a33f3ddbb75d1ccf806d71fe58c6a7ca9ce63518ea6b"

      def install
        bin.install "pyvenv"
        bash_completion.install "completions/pyvenv.bash" => "pyvenv"
        zsh_completion.install "completions/pyvenv.zsh" => "_pyvenv"
        fish_completion.install "completions/pyvenv.fish"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/dhruvmanila/pyvenv/releases/download/v0.6.1/pyvenv-0.6.1-darwin-amd64.tar.gz"
      sha256 "63376a2c314b993a06ae7a74a37f6f5d010717e53618f504d84a4ca55869d9be"

      def install
        bin.install "pyvenv"
        bash_completion.install "completions/pyvenv.bash" => "pyvenv"
        zsh_completion.install "completions/pyvenv.zsh" => "_pyvenv"
        fish_completion.install "completions/pyvenv.fish"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dhruvmanila/pyvenv/releases/download/v0.6.1/pyvenv-0.6.1-linux-arm64.tar.gz"
      sha256 "a21fbd88577aff241939592f1a070e249756ca4d6adb9ffd5891e1e89308414f"

      def install
        bin.install "pyvenv"
        bash_completion.install "completions/pyvenv.bash" => "pyvenv"
        zsh_completion.install "completions/pyvenv.zsh" => "_pyvenv"
        fish_completion.install "completions/pyvenv.fish"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/dhruvmanila/pyvenv/releases/download/v0.6.1/pyvenv-0.6.1-linux-amd64.tar.gz"
      sha256 "95f463d8d22af209b36f24adbbac0da12b3d1f80143e0d4facf09a0d6485bfa3"

      def install
        bin.install "pyvenv"
        bash_completion.install "completions/pyvenv.bash" => "pyvenv"
        zsh_completion.install "completions/pyvenv.zsh" => "_pyvenv"
        fish_completion.install "completions/pyvenv.fish"
      end
    end
  end

  test do
    system "#{bin}/pyvenv --version"
  end
end
