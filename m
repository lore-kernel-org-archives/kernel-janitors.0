From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:21:18 +0000
Subject: [PATCH 27/37] drivers/input/touchscreen: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152321020.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/input/touchscreen/usbtouchscreen.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff -u -p a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -811,12 +811,11 @@ static int nexio_init(struct usbtouch_us
 
 	priv = usbtouch->priv;
 
-	priv->ack_buf = kmalloc(sizeof(nexio_ack_pkt), GFP_KERNEL);
+	priv->ack_buf = kmemdup(nexio_ack_pkt, sizeof(nexio_ack_pkt),
+				GFP_KERNEL);
 	if (!priv->ack_buf)
 		goto err_priv;
 
-	memcpy(priv->ack_buf, nexio_ack_pkt, sizeof(nexio_ack_pkt));
-
 	priv->ack = usb_alloc_urb(0, GFP_KERNEL);
 	if (!priv->ack) {
 		dbg("%s - usb_alloc_urb failed: usbtouch->ack", __func__);
