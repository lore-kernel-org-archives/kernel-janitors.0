From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 18:18:21 +0000
Subject: [PATCH 08/21] Staging: otus: Makefile: cleaned up makefile cflag lines
Message-Id: <1285352314-5939-8-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285352314-5939-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1285352314-5939-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed to use the proper ccflags-y option

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/otus/Makefile |   34 +++++++++++++++++-----------------
 1 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/otus/Makefile b/drivers/staging/otus/Makefile
index debcc5c..df825c6 100644
--- a/drivers/staging/otus/Makefile
+++ b/drivers/staging/otus/Makefile
@@ -1,25 +1,25 @@
 obj-$(CONFIG_OTUS)	+= arusb_lnx.o
 
-EXTRA_CFLAGS += -DAMAC
-EXTRA_CFLAGS += -DGCCK
-EXTRA_CFLAGS += -DOFDM
-EXTRA_CFLAGS += -DTXQ_IN_ISR
-EXTRA_CFLAGS += -DWLAN_HOSTIF=0 #0:USB, 1:PCI
+ccflags-y += -DAMAC
+ccflags-y += -DGCCK
+ccflags-y += -DOFDM
+ccflags-y += -DTXQ_IN_ISR
+ccflags-y += -DWLAN_HOSTIF=0 #0:USB, 1:PCI
 
 #Test Mode
-EXTRA_CFLAGS += -DZM_USB_STREAM_MODE=1
-EXTRA_CFLAGS += -DZM_USB_TX_STREAM_MODE=0
-EXTRA_CFLAGS += -DZM_PCI_DMA_TEST=0
-EXTRA_CFLAGS += -DZM_LARGEPAYLOAD_TEST=0
-EXTRA_CFLAGS += -DZM_FW_LOOP_BACK=0
-EXTRA_CFLAGS += -DZM_LINUX_TPC=1
-#EXTRA_CFLAGS += -DZM_DONT_COPY_RX_BUFFER
+ccflags-y += -DZM_USB_STREAM_MODE=1
+ccflags-y += -DZM_USB_TX_STREAM_MODE=0
+ccflags-y += -DZM_PCI_DMA_TEST=0
+ccflags-y += -DZM_LARGEPAYLOAD_TEST=0
+ccflags-y += -DZM_FW_LOOP_BACK=0
+ccflags-y += -DZM_LINUX_TPC=1
+#ccflags-y += -DZM_DONT_COPY_RX_BUFFER
 
-EXTRA_CFLAGS += -DZM_HOSTAPD_SUPPORT
-#EXTRA_CFLAGS += -DfTX_GAIN_OFDM=0
-#EXTRA_CFLAGS += -DZM_CONFIG_BIG_ENDIAN -DBIG_ENDIAN
-EXTRA_CFLAGS += -DZM_HALPLUS_LOCK
-EXTRA_CFLAGS += -DZM_OTUS_LINUX_PHASE_2
+ccflags-y += -DZM_HOSTAPD_SUPPORT
+ccflags-y += -DfTX_GAIN_OFDM=0
+ccflags-y += -DZM_CONFIG_BIG_ENDIAN -DBIG_ENDIAN
+ccflags-y += -DZM_HALPLUS_LOCK
+ccflags-y += -DZM_OTUS_LINUX_PHASE_2
 
 arusb_lnx-objs := \
 	usbdrv.o \
-- 
1.7.3

