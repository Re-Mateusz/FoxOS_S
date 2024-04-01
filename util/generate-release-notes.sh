#!/bin/bash
VERSION=$(git describe --exact-match --tags)
LAST=$(git describe --abbrev=0 --tags ${VERSION}^)
CHANGELOG=$(git log --pretty=format:%s ${LAST}..HEAD | grep ':' | sed -re 's/([^:]*)\:/- \`\1\`\:/' | sort)
cat <<NOTES
# FireflyOS ${VERSION}

Put a screenshot here.

## What's New in ${VERSION}?

Describe the release here.

## What is FireflyOS?

FireflyOS is a hobbyist, educational operating system for x86-64 PCs, focused primarily on use in virtual machines. It provides a Unix-like environment, complete with a graphical desktop interface, shared libraries, feature-rich terminal emulator, and support for running, GCC, Quake, and several other ports. The core of FireflyOS, provided by the CD images in this release, is built completely from scratch. The bootloader, kernel, drivers, C standard library, and userspace applications are all original software created by the authors, as are the graphical assets.

## Who wrote FireflyOS?

FireflyOS is primarily written by a single maintainer, with several contributions from others. A complete list of contributors is available from [AUTHORS](https://github.com/klange/FireflyOS/blob/master/AUTHORS).

## Running FireflyOS

It is recommended that you run FireflyOS in a virtual machine / emulator, for maximum compatibility. FireflyOS's driver support is limited, and running on real "bare metal", while possible, does not provide the most complete experience of the OS's capabilities except on very particular hardware. FireflyOS is regularly tested in VirtualBox, QEMU, and VMWare Player, and can be successfully booted (with poor performance) in Bochs. FireflyOS is intended to run from a live CD, though it is possible to install to a hard disk. Additional details on running FireflyOS in different virtual machines is available [from the README](https://github.com/klange/FireflyOS#running-FireflyOS).

## Release Files

\`image.iso\` is the standard build of FireflyOS, built by the Github Actions CI workflow. It uses FireflyOS's native bootloaders and should work in most virtual machines using BIOS.

## Changelog
${CHANGELOG}

## Known Issues
- The SMP scheduler is known to have performance issues.
- Several utilities, libc functions, and hardware drivers are missing functionality.
- There are many known security issues with FireflyOS. You should not use FireflyOS in a production environment - it is a hobby project, not a production operating system. If you find security issues in FireflyOS and would like to responsibly report them, please file a regular issue report here on GitHub.
NOTES
