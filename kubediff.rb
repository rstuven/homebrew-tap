class Kubediff < Formula
  desc "A tool for Kubernetes to show differences between running state and version controlled configuration."
  homepage "https://github.com/weaveworks/kubediff"
  url "https://github.com/weaveworks/kubediff/archive/d6f9337b580ce897c6f8035f1de641ae0427fd99.zip"
  sha256 "c5ccb350b6bb9e7dd801d9f017f8d9e6756f43a852f04d894ca7104f7f183382"
  version "0.1.0"
  
  depends_on :python if MacOS.version <= :snow_leopard

  resource "attrs" do
    url "https://pypi.python.org/packages/be/41/e909cb6d901e9689da947419505cc7fb7d242a08a62ee221fce6a009a523/attrs-17.2.0.tar.gz"
    sha256 "5d4d1b99f94d69338f485984127e4473b3ab9e20f43821b0e546cc3b2302fd11"
  end

  resource "pyyaml" do
    url "https://pypi.python.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz"
    sha256 "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
  end

  resource "tabulate" do
    url "https://pypi.python.org/packages/1c/a1/3367581782ce79b727954f7aa5d29e6a439dc2490a9ac0e7ea0a7115435d/tabulate-0.7.7.tar.gz"
    sha256 "83a0b8e17c09f012090a50e1e97ae897300a72b35e0c86c0b53d3bd2ae86d8c6"
  end

  include Language::Python::Virtualenv

  def install
    virtualenv_install_with_resources
  end

  test do
    system "kubediff", "--help"
  end
end
