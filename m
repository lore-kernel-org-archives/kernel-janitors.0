From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 Jan 2018 20:13:19 +0000
Subject: [PATCH 2/2] wireless: libertas_tf: Improve a size determination in two functions
Message-Id: <2887651c-f571-120e-1a63-1768db668ee4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e8b93aae-8dea-7089-43fe-9222054f0749@users.sourceforge.net>
In-Reply-To: <e8b93aae-8dea-7089-43fe-9222054f0749@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, Kees Cook <keescook@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 Jan 2018 21:02:17 +0100

Replace the specification of data structures by variable references
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/wireless/marvell/libertas_tf/if_usb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/marvell/libertas_tf/if_usb.c b/drivers/net/wireless/marvell/libertas_tf/if_usb.c
index 9eebc84cd15a..98e81a6f2338 100644
--- a/drivers/net/wireless/marvell/libertas_tf/if_usb.c
+++ b/drivers/net/wireless/marvell/libertas_tf/if_usb.c
@@ -152,7 +152,7 @@ static int if_usb_probe(struct usb_interface *intf,
 	lbtf_deb_enter(LBTF_DEB_USB);
 	udev = interface_to_usbdev(intf);
 
-	cardp = kzalloc(sizeof(struct if_usb_card), GFP_KERNEL);
+	cardp = kzalloc(sizeof(*cardp), GFP_KERNEL);
 	if (!cardp)
 		goto error;
 
@@ -536,8 +536,7 @@ static void if_usb_receive_fwload(struct urb *urb)
 		return;
 	}
 
-	syncfwheader = kmemdup(skb->data, sizeof(struct fwsyncheader),
-			       GFP_ATOMIC);
+	syncfwheader = kmemdup(skb->data, sizeof(*syncfwheader), GFP_ATOMIC);
 	if (!syncfwheader) {
 		lbtf_deb_usbd(&cardp->udev->dev,
 			"Failure to allocate syncfwheader\n");
-- 
2.15.1

