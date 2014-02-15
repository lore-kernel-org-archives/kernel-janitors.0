From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 15 Feb 2014 07:36:12 +0000
Subject: [PATCH 2/3] staging: r8188eu: delete unnecessary field initialization
Message-Id: <1392449773-23429-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

On success, the function netdev_alloc_skb initializes the dev field of its
result to its first argument, so this doesn't have to be done in the
calling context.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression skb,privn,e;
@@

skb = netdev_alloc_skb(privn,...);
... when strict
(
-skb->dev = privn;
|
?skb = e
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/rtl8188eu/hal/usb_ops_linux.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_ops_linux.c b/drivers/staging/rtl8188eu/hal/usb_ops_linux.c
index 74ee2e6..b92b4f5 100644
--- a/drivers/staging/rtl8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/rtl8188eu/hal/usb_ops_linux.c
@@ -384,7 +384,6 @@ static int recvbuf2recvframe(struct adapter *adapt, struct sk_buff *pskb)
 
 		pkt_copy = netdev_alloc_skb(adapt->pnetdev, alloc_sz);
 		if (pkt_copy) {
-			pkt_copy->dev = adapt->pnetdev;
 			precvframe->u.hdr.pkt = pkt_copy;
 			precvframe->u.hdr.rx_head = pkt_copy->data;
 			precvframe->u.hdr.rx_end = pkt_copy->data + alloc_sz;

