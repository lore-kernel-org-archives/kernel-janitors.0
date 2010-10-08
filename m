From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:49 +0000
Subject: [PATCH 29/33] Staging: usbip: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-29-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y in Makefile.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/usbip/Makefile |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/usbip/Makefile b/drivers/staging/usbip/Makefile
index 10307f8..279f3cc 100644
--- a/drivers/staging/usbip/Makefile
+++ b/drivers/staging/usbip/Makefile
@@ -1,11 +1,11 @@
 obj-$(CONFIG_USB_IP_COMMON) += usbip_common_mod.o
-usbip_common_mod-objs := usbip_common.o usbip_event.o
+usbip_common_mod-y := usbip_common.o usbip_event.o
 
 obj-$(CONFIG_USB_IP_VHCI_HCD) += vhci-hcd.o
-vhci-hcd-objs := vhci_sysfs.o vhci_tx.o vhci_rx.o vhci_hcd.o
+vhci-hcd-y := vhci_sysfs.o vhci_tx.o vhci_rx.o vhci_hcd.o
 
 obj-$(CONFIG_USB_IP_HOST) += usbip.o
-usbip-objs := stub_dev.o stub_main.o stub_rx.o stub_tx.o
+usbip-y := stub_dev.o stub_main.o stub_rx.o stub_tx.o
 
 ccflags-$(CONFIG_USB_IP_DEBUG_ENABLE) := -DDEBUG
 
-- 
1.7.3.1.50.g1e633

