From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 23:28:03 +0000
Subject: [PATCH v2 15/22] Staging: rtl8192u: Makefile: cleaned up makefile cflag lines
Message-Id: <1285370890-8984-15-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/rtl8192u/Makefile |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192u/Makefile b/drivers/staging/rtl8192u/Makefile
index 738f4a8..1710921 100644
--- a/drivers/staging/rtl8192u/Makefile
+++ b/drivers/staging/rtl8192u/Makefile
@@ -1,16 +1,16 @@
 NIC_SELECT = RTL8192U
 
-EXTRA_CFLAGS += -std=gnu89
-EXTRA_CFLAGS += -O2
+ccflags-y := -std=gnu89
+ccflags-y := -O2
 
-EXTRA_CFLAGS += -DCONFIG_FORCE_HARD_FLOAT=y
-EXTRA_CFLAGS += -DJACKSON_NEW_8187 -DJACKSON_NEW_RX
-EXTRA_CFLAGS += -DTHOMAS_BEACON -DTHOMAS_TASKLET -DTHOMAS_SKB -DTHOMAS_TURBO
-#EXTRA_CFLAGS += -DUSB_TX_DRIVER_AGGREGATION_ENABLE
-#EXTRA_CFLAGS += -DUSB_RX_AGGREGATION_SUPPORT
-EXTRA_CFLAGS += -DUSE_ONE_PIPE
-EXTRA_CFLAGS += -DENABLE_DOT11D
-EXTRA_CFLAGS += -Idrivers/staging/rtl8192u/ieee80211
+ccflags-y := -DCONFIG_FORCE_HARD_FLOAT=y
+ccflags-y := -DJACKSON_NEW_8187 -DJACKSON_NEW_RX
+ccflags-y += -DTHOMAS_BEACON -DTHOMAS_TASKLET -DTHOMAS_SKB -DTHOMAS_TURBO
+#ccflags-y := -DUSB_TX_DRIVER_AGGREGATION_ENABLE
+#ccflags-y := -DUSB_RX_AGGREGATION_SUPPORT
+ccflags-y += -DUSE_ONE_PIPE
+ccflags-y += -DENABLE_DOT11D
+ccflags-y += -Idrivers/staging/rtl8192u/ieee80211
 
 r8192u_usb-objs := r8192U_core.o r8180_93cx6.o r8192U_wx.o		\
 		  r8190_rtl8256.o r819xU_phy.o r819xU_firmware.o	\
-- 
1.7.3

