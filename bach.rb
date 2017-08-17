require "language/go"

class Bach < Formula
  desc "A command line for the Compose API."
  homepage "https://github.com/compose/bach"
  url "https://github.com/compose/bach/archive/0.1.0.zip"
  sha256 "7de0e5a69bc346351378fcf9fd383da94e0efcfb4d55e0bbd301da7cccec1213"

  depends_on "go" => :build
  depends_on "glide" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
    dir = buildpath/"src/github.com/compose/bach"
    dir.install Dir["*"]
    cd dir do
      system "glide", "install"
      system "go", "build", "-o", bin/"bach"
    end
  end

  test do
    system "bach", "--help"
  end
end
