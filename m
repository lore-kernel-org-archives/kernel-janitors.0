From: Julia Lawall <julia@diku.dk>
Date: Wed, 20 May 2009 07:17:11 +0000
Subject: [PATCH] drivers/staging/cpc-usb: Adjust NULL test
Message-Id: <Pine.LNX.4.64.0905200916280.12274@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, haas@ems-wuensche.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Since card must already be non-NULL, it seems that what was intended
was to test the result of kmalloc.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression E,E1;
identifier f,fld,fld1;
statement S1,S2;
@@

E->fld = f(...);
... when != E = E1
    when != E->fld1 = E1
if (
-   E
+   E->fld
           = NULL) S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/cpc-usb/cpc-usb_drv.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/staging/cpc-usb/cpc-usb_drv.c b/drivers/staging/cpc-usb/cpc-usb_drv.c
--- a/drivers/staging/cpc-usb/cpc-usb_drv.c
+++ b/drivers/staging/cpc-usb/cpc-usb_drv.c
@@ -899,7 +899,7 @@ static int cpcusb_probe(struct usb_inter
 
 	/* allocate and initialize the channel struct */
 	card->chan = kmalloc(sizeof(CPC_CHAN_T), GFP_KERNEL);
-	if (!card) {
+	if (!card->chan) {
 		kfree(card);
 		err("Out of memory");
 		return -ENOMEM;
