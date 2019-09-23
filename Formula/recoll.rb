class Recoll < Formula
  desc "Recoll is a desktop full-text search tool."
  homepage "https://www.lesbonscomptes.com/recoll/"
  url "https://www.lesbonscomptes.com/recoll/recoll-1.25.22.tar.gz"
  sha256 "500d114952aa03c222847df8ecd0f9c58fc1d03b940df72de81e02e52ca905bc"

  depends_on "xapian"
  depends_on "qt"
  depends_on "aspell"

  def install
    inreplace "Makefile.in",
      "-Wl,--no-undefined -Wl,--warn-unresolved-symbols", "--no-undefined --warn-unresolved-symbols"

    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--without-x",
                          "--disable-x11mon",
                          "--without-aspell",
                          "--disable-python-module",
                          "--disable-python-chm",
                          "--enable-recollq",
                          "--disable-webkit", # requires qtwebkit, which is not bundled with qt5
                          "--prefix=#{prefix}"
    system "make", "install" 

    mkdir libexec
    mv bin/"recoll.app", libexec/"recoll.app"
  end

  test do
    system "true"
  end
end
