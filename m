From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:16:03 +0000
Subject: [PATCH 10/37] drivers/net/wireless/libertas_tf: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152315450.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kmemdup when some other buffer is immediately copied into the
allocated region.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to,size,flag;
statement S;
@@

-  to = \(kmalloc\|kzalloc\)(size,flag);
+  to = kmemdup(from,size,flag);
   if (to=NULL || ...) S
-  memcpy(to, from, size);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/wireless/libertas_tf/if_usb.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff -u -p a/drivers/net/wireless/libertas_tf/if_usb.c b/drivers/net/wireless/libertas_tf/if_usb.c
--- a/drivers/net/wireless/libertas_tf/if_usb.c
+++ b/drivers/net/wireless/libertas_tf/if_usb.c
@@ -538,7 +538,8 @@ static void if_usb_receive_fwload(struct
 		return;
 	}
 
-	syncfwheader = kmalloc(sizeof(struct fwsyncheader), GFP_ATOMIC);
+	syncfwheader = kmemdup(skb->data, sizeof(struct fwsyncheader),
+			       GFP_ATOMIC);
 	if (!syncfwheader) {
 		lbtf_deb_usbd(&cardp->udev->dev, "Failure to allocate syncfwheader\n");
 		kfree_skb(skb);
@@ -546,8 +547,6 @@ static void if_usb_receive_fwload(struct
 		return;
 	}
 
-	memcpy(syncfwheader, skb->data, sizeof(struct fwsyncheader));
-
 	if (!syncfwheader->cmd) {
 		lbtf_deb_usb2(&cardp->udev->dev, "FW received Blk with correct CRC\n");
 		lbtf_deb_usb2(&cardp->udev->dev, "FW received Blk seqnum = %d\n",
