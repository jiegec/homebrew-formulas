class Symbiyosys < Formula
  desc "Project IceStorm"
  homepage "http://symbiyosys.readthedocs.io/"
  license "ISC"
  head "https://github.com/YosysHQ/SymbiYosys.git"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/sby", "-v"
  end
end
