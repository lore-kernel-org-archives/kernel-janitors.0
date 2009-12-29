From: Julia Lawall <julia@diku.dk>
Date: Tue, 29 Dec 2009 19:16:22 +0000
Subject: [PATCH 4/5] drivers/usb : Correct the size argument to kzalloc
Message-Id: <Pine.LNX.4.64.0912292016040.4001@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

urb_priv->tds has type struct td **, not struct td *, so the
elements of the array should have pointer type, not structure type.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@disable sizeof_type_expr@
type T;
T **x;
@@

  x   <+...sizeof(
- T
+ *x
  )...+>
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/host/fhci-hcd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -432,7 +432,7 @@ static int fhci_urb_enqueue(struct usb_h
 		return -ENOMEM;
 
 	/* allocate the private part of the URB */
-	urb_priv->tds = kzalloc(size * sizeof(struct td), mem_flags);
+	urb_priv->tds = kzalloc(size * sizeof(*urb_priv->tds), mem_flags);
 	if (!urb_priv->tds) {
 		kfree(urb_priv);
 		return -ENOMEM;
