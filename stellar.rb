class Stellar < Formula
  desc "Fast database snapshot and restore tool for development."
  homepage "https://github.com/fastmonkeys/stellar"
  url "https://github.com/fastmonkeys/stellar/archive/566bcc3ebf725b308568ea30b68a5758a886f98a.zip"
  sha256 "ffeda9b5756c0e632d40ceb91aa6b802015066d6eefc2e7a825745ee80fd78b8"
  version "0.1.0"
  
  depends_on :python if MacOS.version <= :snow_leopard

  resource "PyYAML" do
    url "https://pypi.python.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz"
    sha256 "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
  end

  resource "SQLAlchemy" do
    url "https://pypi.python.org/packages/a2/43/e90732a93d512c1c8b27f38990a8531b208c34fae0de661ef81668131095/SQLAlchemy-1.1.13.tar.gz"
    sha256 "2a98ac87b30eaa2bee1f1044848b9590e476e7f93d033c6542e60b993a5cf898"
  end

  resource "humanize" do
    url "https://pypi.python.org/packages/8c/e0/e512e4ac6d091fc990bbe13f9e0378f34cf6eecd1c6c268c9e598dcf5bb9/humanize-0.5.1.tar.gz"
    sha256 "a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19"
  end

  resource "pytest" do
    url "https://pypi.python.org/packages/6d/9f/1fbd50be4deaa4007ef4ed8f84f888c6613c629e1f46e979ffb9d82a7324/pytest-3.2.1.tar.gz"
    sha256 "4c2159d2be2b4e13fa293e7a72bdf2f06848a017150d5c6d35112ce51cfd74ce"
  end

  resource "schema" do
    url "https://pypi.python.org/packages/05/5c/25b7fccf722d579d1368415db031dbefedbbddac125363f7827af6aa5ece/schema-0.6.6.tar.gz"
    sha256 "758b59ffc654d3794f6edd6e67db948f26164ddcd3cd7dde8bbeefc4934482d3"
  end

  resource "psutil" do
    url "https://pypi.python.org/packages/57/93/47a2e3befaf194ccc3d05ffbcba2cdcdd22a231100ef7e4cf63f085c900b/psutil-5.2.2.tar.gz"
    sha256 "44746540c0fab5b95401520d29eb9ffe84b3b4a235bd1d1971cbe36e1f38dd13"
  end

  resource "click" do
    url "https://pypi.python.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz"
    sha256 "f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b"
  end

  resource "SQLAlchemy-Utils" do
    url "https://pypi.python.org/packages/ce/46/eaf163b7f4db1e7dc648f1036902892c91a99f2ee7a5191af0eb9cf39a2e/SQLAlchemy-Utils-0.32.14.tar.gz"
    sha256 "e74b0338f4d56dcb0cb57f1b4f5afee5b2ffe595dd5a68b62da66ea4a7399cce"
  end

  resource "six" do
    url "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"
    sha256 "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
  end

  resource "py" do
    url "https://pypi.python.org/packages/68/35/58572278f1c097b403879c1e9369069633d1cbad5239b9057944bb764782/py-1.4.34.tar.gz"
    sha256 "0f2d585d22050e90c7d293b6451c83db097df77871974d90efd5a30dc12fcde3"
  end

  resource "PyMySQL" do
    url "https://pypi.python.org/packages/29/f8/919a28976bf0557b7819fd6935bfd839118aff913407ca58346e14fa6c86/PyMySQL-0.7.11.tar.gz"
    sha256 "56e3f5bcef6501012233620b54f6a7b8a34edc5751e85e4e3da9a0d808df5f68"
  end

  # # InstallationError: Command "python setup.py egg_info" failed with error code 1
  # resource "psycopg2" do
  #   url "https://pypi.python.org/packages/98/99/33ca02c4bc3ed1bd9ceab5614bda2e6d1d31e61ec58345b9feece238c38a/psycopg2-2.7.3.tar.gz"
  #   sha256 "c9bd49848556d04093909faec017c3675efabf78c2b7f383bf7c43ba18324ac8"
  # end

  include Language::Python::Virtualenv

  def install
    venv = virtualenv_create libexec
    venv.pip_install resources
    self.system libexec/"bin/pip", "install", "-v", "--no-deps", "--ignore-installed", "psycopg2==2.7.3"
    venv.pip_install_and_link buildpath
  end

  test do
    system "stellar", "--help"
  end
end
