From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 23:33:33 +0000
Subject: [PATCH v2 16/22] Staging: rtl8192u: ieee80211: Makefile: cleaned up makefile cflag lines
Message-Id: <1285371213-9097-1-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285370890-8984-16-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1285370890-8984-16-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed yo use the proper ccflags-y option

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/Makefile |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/Makefile b/drivers/staging/rtl8192u/ieee80211/Makefile
index 71ca5d9..c45ebf9 100644
--- a/drivers/staging/rtl8192u/ieee80211/Makefile
+++ b/drivers/staging/rtl8192u/ieee80211/Makefile
@@ -5,22 +5,22 @@ MODDESTDIR := /lib/modules/$(KVER)/kernel/drivers/net/wireless/$(NIC_SELECT)
 
 CC = gcc
 ifneq ($(shell uname -r|cut -d. -f1,2), 2.4)
-EXTRA_CFLAGS += -I$(TOPDIR)/drivers/net/wireless
-EXTRA_CFLAGS += -O2
-EXTRA_CFLAGS += -DJACKSON_NEW_8187 -DJACKSON_NEW_RX
+ccflags-y := -I$(TOPDIR)/drivers/net/wireless
+ccflags-y := -O2
+ccflags-y := -DJACKSON_NEW_8187 -DJACKSON_NEW_RX
 
 #it will fail to compile in suse linux enterprise 10 sp2. This flag is to solve this problem.
 ifeq ($(shell uname -r | cut -d. -f1,2,3,4), 2.6.16.60-0)
-EXTRA_CFLAGS += -DOPENSUSE_SLED
+ccflags-y := -DOPENSUSE_SLED
 endif
 
 ifeq ($(NIC_SELECT),RTL8192U)
-#EXTRA_CFLAGS += -DUSB_TX_DRIVER_AGGREGATION_ENABLE
-#EXTRA_CFLAGS += -DUSB_RX_AGGREGATION_SUPPORT
+#ccflags-y := -DUSB_TX_DRIVER_AGGREGATION_ENABLE
+#ccflags-y := -DUSB_RX_AGGREGATION_SUPPORT
 endif
-#EXTRA_CFLAGS += -DJOHN_NOCPY
+#ccflags-y := -DJOHN_NOCPY
 #flags to enable or disble 80211D feature
-EXTRA_CFLAGS += -DENABLE_DOT11D
+ccflags-y := -DENABLE_DOT11D
 ieee80211-rsl-objs := ieee80211_rx.o \
 		      ieee80211_softmac.o \
 		      ieee80211_tx.o \
-- 
1.7.3

