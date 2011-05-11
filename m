From: matt mooney <mfmooney@gmail.com>
Date: Wed, 11 May 2011 08:54:23 +0000
Subject: [PATCH 11/12] staging: usbip: vhci.h: reorganize
Message-Id: <cf3104ab782e4017b0953845c32bf9d4b002ad8e.1305103213.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
In-Reply-To: <cover.1305103212.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Split function declarations by source file.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/vhci.h |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/usbip/vhci.h b/drivers/staging/usbip/vhci.h
index 691cf74..d5bc8e7 100644
--- a/drivers/staging/usbip/vhci.h
+++ b/drivers/staging/usbip/vhci.h
@@ -106,16 +106,18 @@ struct vhci_hcd {
 
 extern struct vhci_hcd *the_controller;
 extern struct attribute_group dev_attr_group;
+#define hardware (&the_controller->pdev.dev)
 
 /* vhci_hcd.c */
 void rh_port_connect(int rhport, enum usb_device_speed speed);
 void rh_port_disconnect(int rhport);
-int vhci_rx_loop(void *data);
-int vhci_tx_loop(void *data);
 
+/* vhci_rx.c */
 struct urb *pickup_urb_and_free_priv(struct vhci_device *vdev, __u32 seqnum);
+int vhci_rx_loop(void *data);
 
-#define hardware (&the_controller->pdev.dev)
+/* vhci_tx.c */
+int vhci_tx_loop(void *data);
 
 static inline struct vhci_device *port_to_vdev(__u32 port)
 {
-- 
1.7.5.1

