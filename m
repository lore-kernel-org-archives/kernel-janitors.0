From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 21 Mar 2020 15:29:38 +0000
Subject: [PATCH] usbip: vhci_hcd: slighly simplify code in 'vhci_urb_dequeue()'
Message-Id: <20200321152938.19580-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: valentina.manea.m@gmail.com, shuah@kernel.org, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The allocation of 'unlink' can be moved before a spin_lock.
This slighly simplifies the error handling if the memory allocation fails,
aligns the code structure with what is done in 'vhci_tx_urb()' and reduces
potential lock contention.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/usbip/vhci_hcd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 65850e9c7190..b909a634260c 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -905,17 +905,16 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		/* tcp connection is alive */
 		struct vhci_unlink *unlink;
 
-		spin_lock(&vdev->priv_lock);
-
 		/* setup CMD_UNLINK pdu */
 		unlink = kzalloc(sizeof(struct vhci_unlink), GFP_ATOMIC);
 		if (!unlink) {
-			spin_unlock(&vdev->priv_lock);
 			spin_unlock_irqrestore(&vhci->lock, flags);
 			usbip_event_add(&vdev->ud, VDEV_EVENT_ERROR_MALLOC);
 			return -ENOMEM;
 		}
 
+		spin_lock(&vdev->priv_lock);
+
 		unlink->seqnum = atomic_inc_return(&vhci_hcd->seqnum);
 		if (unlink->seqnum = 0xffff)
 			pr_info("seqnum max\n");
-- 
2.20.1
