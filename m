From: matt mooney <mfmooney@gmail.com>
Date: Wed, 11 May 2011 08:54:13 +0000
Subject: [PATCH 01/12] staging: usbip: change debug configuration option
Message-Id: <805d4e38e30c6a9032df1fb73a258ba5aff70089.1305103212.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
In-Reply-To: <cover.1305103212.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Change CONFIG_USB_IP_DEBUG_ENABLE to CONFIG_USB_IP_DEBUG, and move
ccflags- to the head of the makefile.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/Kconfig        |    4 ++--
 drivers/staging/usbip/Makefile       |    5 ++---
 drivers/staging/usbip/usbip_common.c |    2 +-
 drivers/staging/usbip/usbip_common.h |    8 ++++----
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/usbip/Kconfig b/drivers/staging/usbip/Kconfig
index 2c1d10a..466f0d3 100644
--- a/drivers/staging/usbip/Kconfig
+++ b/drivers/staging/usbip/Kconfig
@@ -35,8 +35,8 @@ config USB_IP_HOST
 	 To compile this driver as a module, choose M here: the
 	 module will be called usbip.
 
-config USB_IP_DEBUG_ENABLE
-	bool "USB-IP Debug Enable"
+config USB_IP_DEBUG
+	bool "USB/IP debug messages"
 	depends on USB_IP_COMMON
 	default N
 	---help---
diff --git a/drivers/staging/usbip/Makefile b/drivers/staging/usbip/Makefile
index 279f3cc..a43a890 100644
--- a/drivers/staging/usbip/Makefile
+++ b/drivers/staging/usbip/Makefile
@@ -1,3 +1,5 @@
+ccflags-$(CONFIG_USB_IP_DEBUG) := -DDEBUG
+
 obj-$(CONFIG_USB_IP_COMMON) += usbip_common_mod.o
 usbip_common_mod-y := usbip_common.o usbip_event.o
 
@@ -6,6 +8,3 @@ vhci-hcd-y := vhci_sysfs.o vhci_tx.o vhci_rx.o vhci_hcd.o
 
 obj-$(CONFIG_USB_IP_HOST) += usbip.o
 usbip-y := stub_dev.o stub_main.o stub_rx.o stub_tx.o
-
-ccflags-$(CONFIG_USB_IP_DEBUG_ENABLE) := -DDEBUG
-
diff --git a/drivers/staging/usbip/usbip_common.c b/drivers/staging/usbip/usbip_common.c
index b46e9b5..279cad4 100644
--- a/drivers/staging/usbip/usbip_common.c
+++ b/drivers/staging/usbip/usbip_common.c
@@ -30,7 +30,7 @@
 #define DRIVER_AUTHOR "Takahiro Hirofuchi <hirofuchi@users.sourceforge.net>"
 #define DRIVER_DESC "USB/IP Common Driver"
 
-#ifdef CONFIG_USB_IP_DEBUG_ENABLE
+#ifdef CONFIG_USB_IP_DEBUG
 unsigned long usbip_debug_flag = 0xffffffff;
 #else
 unsigned long usbip_debug_flag;
diff --git a/drivers/staging/usbip/usbip_common.h b/drivers/staging/usbip/usbip_common.h
index 0b61d71..c84bed9 100644
--- a/drivers/staging/usbip/usbip_common.h
+++ b/drivers/staging/usbip/usbip_common.h
@@ -27,11 +27,11 @@
 #include <net/sock.h>
 
 /**
- * usbip_udbg - print debug messages if CONFIG_USB_IP_DEBUG_ENABLE is defined
+ * usbip_udbg - print debug messages if CONFIG_USB_IP_DEBUG is defined
  * @fmt:
  * @args:
  */
-#ifdef CONFIG_USB_IP_DEBUG_ENABLE
+#ifdef CONFIG_USB_IP_DEBUG
 
 #define usbip_udbg(fmt, args...)					\
 	do {								\
@@ -40,11 +40,11 @@
 		       __FILE__, __LINE__, __func__, ##args);		\
 	} while (0)
 
-#else  /* CONFIG_USB_IP_DEBUG_ENABLE */
+#else
 
 #define usbip_udbg(fmt, args...)	do { } while (0)
 
-#endif /* CONFIG_USB_IP_DEBUG_ENABLE */
+#endif /* CONFIG_USB_IP_DEBUG */
 
 enum {
 	usbip_debug_xmit	= (1 << 0),
-- 
1.7.5.1

