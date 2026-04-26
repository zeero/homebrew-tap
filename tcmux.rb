class Tcmux < Formula
  desc 'tcmux is a terminal and Claude Code mux viewer.'
  version '0.4.1'
  homepage 'https://github.com/zeero/tcmux'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/zeero/tcmux/releases/download/v0.4.1/tcmux_v0.4.1_darwin_arm64.zip'
      sha256 'sha256:df7a8ebd4e41bbbe61d7acfedd48ab23adbd22928693426cc45075f672cc6ee5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/zeero/tcmux/releases/download/v0.4.0/tcmux_v0.4.0_darwin_amd64.zip'
      sha256 'e04df7999d47d3f8056157f0235c7ac7521d24a3cb3a29412dd54f80b7256251'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/zeero/tcmux/releases/download/v0.4.0/tcmux_v0.4.0_linux_arm64.tar.gz'
      sha256 '14f3aea409a445cc6a11a7900d17a59f6f7b0f39f7c1402b73fa50536167a754'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/zeero/tcmux/releases/download/v0.4.0/tcmux_v0.4.0_linux_amd64.tar.gz'
      sha256 '9870f9939818c503b1d679eb6731fe113544ed0164f5328f7f57883a1f1dcbb4'
    end
  end

  head do
    url 'https://github.com/zeero/tcmux.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tcmux'
  end
end
