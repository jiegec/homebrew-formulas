# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Recoll < Formula
  desc "Recoll is a desktop full-text search tool."
  homepage "https://www.lesbonscomptes.com/recoll/"
  url "https://www.lesbonscomptes.com/recoll/recoll-1.24.3.tar.gz"
  sha256 "f1552961dd0cfd1a12d95fab1bf4990846df2085ddeaa5e832442bbce35acad2"

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
                          "--with-aspell",
                          "--enable-recollq",
                          "--disable-webkit", # requires qtwebkit, which is not bundled with qt5
                          "--prefix=#{prefix}"
    system "make", "install" 

    mkdir libexec
    mv bin/"recoll.app", libexec/"recoll.app"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test recoll`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
