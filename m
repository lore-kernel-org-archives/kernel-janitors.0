From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 23:27:57 +0000
Subject: [PATCH v2 09/22] Staging: rt2860: Makefile: cleaned up makefile cflag lines
Message-Id: <1285370890-8984-9-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285370890-8984-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1285370890-8984-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed to use proper ccflags-y option

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/rt2860/Makefile |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rt2860/Makefile b/drivers/staging/rt2860/Makefile
index 23ae07f..c6ea9b8 100644
--- a/drivers/staging/rt2860/Makefile
+++ b/drivers/staging/rt2860/Makefile
@@ -1,10 +1,10 @@
 obj-$(CONFIG_RT2860)	+= rt2860sta.o
 
 # TODO: all of these should be removed
-EXTRA_CFLAGS += -DLINUX -DAGGREGATION_SUPPORT -DPIGGYBACK_SUPPORT -DWMM_SUPPORT
-EXTRA_CFLAGS += -DRTMP_MAC_PCI -DRTMP_PCI_SUPPORT -DRT2860
-EXTRA_CFLAGS += -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DRT30xx -DRT3090
-EXTRA_CFLAGS += -DDBG
+ccflags-y := -DLINUX -DAGGREGATION_SUPPORT -DPIGGYBACK_SUPPORT -DWMM_SUPPORT
+ccflags-y := -DRTMP_MAC_PCI -DRTMP_PCI_SUPPORT -DRT2860
+ccflags-y := -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DRT30xx -DRT3090
+ccflags-y := -DDBG
 
 rt2860sta-objs :=	\
 	common/crypt_md5.o	\
-- 
1.7.3

