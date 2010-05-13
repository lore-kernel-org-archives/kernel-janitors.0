From: Julia Lawall <julia@diku.dk>
Date: Thu, 13 May 2010 20:02:56 +0000
Subject: [PATCH 11/20] drivers/net/wireless/orinoco: Use kzalloc
Message-Id: <Pine.LNX.4.64.1005132202310.6282@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Roskin <proski@gnu.org>, David Gibson <hermes@gibson.dropbear.id.au>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, orinoco-users@lists.sourceforge.net, orinoco-devel@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kzalloc rather than the combination of kmalloc and memset.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,size,flags;
statement S;
@@

-x = kmalloc(size,flags);
+x = kzalloc(size,flags);
 if (x = NULL) S
-memset(x, 0, size);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/wireless/orinoco/orinoco_usb.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff -u -p a/drivers/net/wireless/orinoco/orinoco_usb.c b/drivers/net/wireless/orinoco/orinoco_usb.c
--- a/drivers/net/wireless/orinoco/orinoco_usb.c
+++ b/drivers/net/wireless/orinoco/orinoco_usb.c
@@ -356,12 +356,10 @@ static struct request_context *ezusb_all
 {
 	struct request_context *ctx;
 
-	ctx = kmalloc(sizeof(*ctx), GFP_ATOMIC);
+	ctx = kzalloc(sizeof(*ctx), GFP_ATOMIC);
 	if (!ctx)
 		return NULL;
 
-	memset(ctx, 0, sizeof(*ctx));
-
 	ctx->buf = kmalloc(BULK_BUF_SIZE, GFP_ATOMIC);
 	if (!ctx->buf) {
 		kfree(ctx);
