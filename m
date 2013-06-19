From: Emil Goode <emilgoode@gmail.com>
Date: Wed, 19 Jun 2013 12:19:01 +0000
Subject: [PATCH] xhci: Add missing unlocks on error paths
Message-Id: <1371644341-11834-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sarah.a.sharp@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

This patch adds missing unlocks on error paths in the
xhci_free_streams and xhci_configure_endpoint functions.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/usb/host/xhci.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6779c92..2c49f00 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2603,6 +2603,7 @@ static int xhci_configure_endpoint(struct xhci_hcd *xhci,
 		in_ctx = virt_dev->in_ctx;
 	ctrl_ctx = xhci_get_input_control_ctx(xhci, in_ctx);
 	if (!ctrl_ctx) {
+		spin_unlock_irqrestore(&xhci->lock, flags);
 		xhci_warn(xhci, "%s: Could not get input context, bad type.\n",
 				__func__);
 		return -ENOMEM;
@@ -3298,6 +3299,7 @@ int xhci_free_streams(struct usb_hcd *hcd, struct usb_device *udev,
 	command = vdev->eps[ep_index].stream_info->free_streams_command;
 	ctrl_ctx = xhci_get_input_control_ctx(xhci, command->in_ctx);
 	if (!ctrl_ctx) {
+		spin_unlock_irqrestore(&xhci->lock, flags);
 		xhci_warn(xhci, "%s: Could not get input context, bad type.\n",
 				__func__);
 		return -EINVAL;
-- 
1.7.10.4

