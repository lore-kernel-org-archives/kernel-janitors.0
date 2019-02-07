From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Date: Thu, 07 Feb 2019 16:40:59 +0000
Subject: [PATCH 4/4] debian: add generic rule file
Message-Id: <1549557659-19137-5-git-send-email-info@metux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1549557659-19137-1-git-send-email-info@metux.net>
In-Reply-To: <1549557659-19137-1-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net

Adding a generic debian rule file, so we can build the directly
via usual Debian package build tools (eg. git-buildpackage,
dck-buildpackage, etc). It expects the .config file already
placed in the source tree.

The rule file contains a rule for creating debian/control and
other metadata - this is done similar to the 'deb-pkg' make rule,
scripts/packaging/mkdebian.
---
 .gitignore   |  1 +
 debian/rules | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100755 debian/rules

diff --git a/.gitignore b/.gitignore
index a20ac26..2d8081f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -68,6 +68,7 @@ modules.builtin
 # Debian directory (make deb-pkg)
 #
 /debian/
+!/debian/rules
 
 #
 # Snap directory (make snap-pkg)
diff --git a/debian/rules b/debian/rules
new file mode 100755
index 0000000..eeb58f7
--- /dev/null
+++ b/debian/rules
@@ -0,0 +1,26 @@
+#!/usr/bin/make -f
+
+export MAKE
+export KERNELARCH           = $(shell $(MAKE) kernelarch)
+export KERNELRELEASE        = $(shell $(MAKE) kernelrelease)
+export KBUILD_DEBARCH       = $(shell dpkg-architecture -qDEB_HOST_ARCH)
+export KBUILD_BUILD_VERSION = $(shell $(MAKE) kernellocalversion)
+export KDEB_RULES           = debian/rules.auto
+export KDEB_SOURCENAME      = linux-source
+export ARCH                 = $(KERNELARCH)
+
+debian/control debian/changelong debian/arch debian/copyright:
+debian/control:
+	./scripts/package/mkdebian
+
+build:	debian/control
+	$(MAKE) KERNELRELEASE=$(KERNELRELEASE) ARCH=$(KERNELARCH) KBUILD_BUILD_VERSION=$(KBUILD_BUILD_VERSION) KBUILD_SRC+
+binary-arch:	debian/control
+	$(MAKE) KERNELRELEASE=$(KERNELRELEASE) ARCH=$(KERNELARCH) KBUILD_BUILD_VERSION=$(KBUILD_BUILD_VERSION) KBUILD_SRC= intdeb-pkg
+
+clean:
+	rm -rf debian/*tmp debian/files debian/changelog debian/control debian/copyright debian/rules.auto debian/arch
+	$(MAKE) clean
+
+binary: binary-arch
-- 
1.9.1
