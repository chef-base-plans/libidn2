pkg_name=libidn2
pkg_origin=core
pkg_version="2.3.0"
pkg_description="Implementation of IDNA2008, Punycode and TR46 (Internationalized domain names)"
pkg_upstream_url="https://www.gnu.org/software/libidn/#libidn2"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('GPL-2.0' 'LGPL-3.0')
pkg_source="https://ftp.gnu.org/gnu/libidn/libidn2-2.0.4.tar.gz"
pkg_shasum=e1cb1db3d2e249a6a3eb6f0946777c2e892d5c5dc7bd91c74394fc3a01cab8b5
pkg_deps=(
  core/glibc
  core/libiconv
  core/libunistring
)
pkg_build_deps=(
  core/diffutils
  core/gcc
  core/gettext
  core/make
  core/pkg-config
)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib/pkgconfig)


do_check() {
  make check
}
