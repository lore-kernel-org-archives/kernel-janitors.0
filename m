From: matt mooney <mfm@muteddisk.com>
Date: Thu, 23 Sep 2010 06:50:06 +0000
Subject: [PATCH 02/20] security/selinux: change to new flag variable
Message-Id: <1285224606-29493-1-git-send-email-mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Smalley <sds@tycho.nsa.gov>
Cc: James Morris <jmorris@namei.org>, Eric Paris <eparis@parisplace.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 security/selinux/Makefile    |    2 +-
 security/selinux/ss/Makefile |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/selinux/Makefile b/security/selinux/Makefile
index 58d80f3..aa9741c 100644
--- a/security/selinux/Makefile
+++ b/security/selinux/Makefile
@@ -18,7 +18,7 @@ selinux-$(CONFIG_SECURITY_NETWORK_XFRM) += xfrm.o
 
 selinux-$(CONFIG_NETLABEL) += netlabel.o
 
-EXTRA_CFLAGS += -Isecurity/selinux -Isecurity/selinux/include
+ccflags-y := -Isecurity/selinux -Isecurity/selinux/include
 
 $(obj)/avc.o: $(obj)/flask.h
 
diff --git a/security/selinux/ss/Makefile b/security/selinux/ss/Makefile
index 15d4e62..6bee7c2 100644
--- a/security/selinux/ss/Makefile
+++ b/security/selinux/ss/Makefile
@@ -2,7 +2,7 @@
 # Makefile for building the SELinux security server as part of the kernel tree.
 #
 
-EXTRA_CFLAGS += -Isecurity/selinux -Isecurity/selinux/include
+ccflags-y := -Isecurity/selinux -Isecurity/selinux/include
 obj-y := ss.o
 
 ss-y := ebitmap.o hashtab.o symtab.o sidtab.o avtab.o policydb.o services.o conditional.o mls.o
-- 
1.7.2.1

