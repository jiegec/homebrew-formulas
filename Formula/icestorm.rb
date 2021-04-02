class Icestorm < Formula
  desc "Project IceStorm"
  homepage "http://www.clifford.at/icestorm/"
  license "ISC"
  head "https://github.com/YosysHQ/icestorm.git"

  depends_on "gnu-sed" => :build

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/iceprog", "-v"
  end
end
