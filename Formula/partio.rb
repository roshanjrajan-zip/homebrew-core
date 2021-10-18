class Partio < Formula
  desc "Particle library for 3D graphics"
  homepage "https://github.com/wdas/partio"
  url "https://github.com/wdas/partio/archive/v1.14.6.tar.gz"
  sha256 "53a5754d6b2fc3e184953d985c233118ef0ab87169f34e3aec4a7e6d20cd9bd4"
  license "BSD-3-Clause"

  bottle do
    sha256 cellar: :any, big_sur:  "276da2b191f9f6e3505231f97c1bec04beb57516876ad6a29b58f4ce7c39b5a8"
    sha256 cellar: :any, catalina: "72063f3cbd49f67e851bf483808f4c08d9052a84c127cf60c73d5f7527459a16"
    sha256 cellar: :any, mojave:   "8f70ed6cbfa1bb929a2a10ddcfa0a1cb527eca76abf02bb7d5b723edf981b612"
  end

  depends_on "cmake" => :build
  depends_on "doxygen" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      system "make", "doc"
      system "make", "install"
    end
    pkgshare.install "src/data"
  end

  test do
    assert_match "Number of particles:  25", shell_output("#{bin}/partinfo #{pkgshare}/data/scatter.bgeo")
  end
end
