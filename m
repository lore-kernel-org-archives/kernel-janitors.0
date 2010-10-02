From: Tracey Dent <tdent48227@gmail.com>
Date: Sat, 02 Oct 2010 16:38:05 +0000
Subject: [PATCH v3 16/20] Staging: usbip: Makefile: cleaned up Makefile cflag lines
Message-Id: <1286037489-28439-16-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286037489-28439-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286037489-28439-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, Tracey Dent <tdent48227@gmail.com>

Changed to use the proper ccflags-y option

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/usbip/Makefile |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/usbip/Makefile b/drivers/staging/usbip/Makefile
index 6f2916b..10307f8 100644
--- a/drivers/staging/usbip/Makefile
+++ b/drivers/staging/usbip/Makefile
@@ -7,6 +7,5 @@ vhci-hcd-objs := vhci_sysfs.o vhci_tx.o vhci_rx.o vhci_hcd.o
 obj-$(CONFIG_USB_IP_HOST) += usbip.o
 usbip-objs := stub_dev.o stub_main.o stub_rx.o stub_tx.o
 
-ifeq ($(CONFIG_USB_IP_DEBUG_ENABLE),y)
-	EXTRA_CFLAGS += -DDEBUG
-endif
+ccflags-$(CONFIG_USB_IP_DEBUG_ENABLE) := -DDEBUG
+
-- 
1.7.3.1.50.g1e633

