FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

BRANCH = "TB_SKINIT_upstream"
SRC_URI_remove = " ${GNU_MIRROR}/grub/grub-${PV}.tar.gz"
SRC_URI_remove = "file://autogen.sh-exclude-pc.patch"
SRC_URI_remove = "file://CVE-2020-10713.patch"
SRC_URI_remove = "file://calloc-Make-sure-we-always-have-an-overflow-checking.patch"
SRC_URI_remove = "file://lvm-Add-LVM-cache-logical-volume-handling.patch"
SRC_URI_remove = "file://CVE-2020-14308-calloc-Use-calloc-at-most-places.patch"
SRC_URI_remove = "file://CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch"
SRC_URI_remove = "file://CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch"
SRC_URI_remove = "file://CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch"
SRC_URI_remove = "file://safemath-Add-some-arithmetic-primitives-that-check-f.patch"
SRC_URI_remove = "file://script-Remove-unused-fields-from-grub_script_functio.patch"

SRC_URI_append = " git://github.com/3mdeb/grub.git;branch=${BRANCH};protocol=https"
SRC_URI_append = " file://autogen.sh-exclude-pc-fixed.patch"
SRC_URI_append = " file://0001-grub-Add-linux-support-for-riscv.patch"

SRCREV = "1a0cbebe77383036bd7cfcaec4d56b0c3a8fa912"

S = "${WORKDIR}/git"

do_configure_prepend() {
(   cd ${S}
    ${S}/bootstrap
    ${S}/autogen.sh )
}

