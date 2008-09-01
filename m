From: Julien Brunel <brunel@diku.dk>
Date: Mon, 01 Sep 2008 08:57:27 +0000
Subject: [PATCH] drivers/usb/misc: Use an IS_ERR test rather than a NULL test
Message-Id: <200809011057.28293.brunel@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julien Brunel <brunel@diku.dk>

In case of error, the function backlight_device_register returns an
ERR pointer, but never returns a NULL pointer. So a NULL test that may
come after a call to this function should be strengthened by an IS_ERR
test.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@match_bad_null_test@
expression x, E;
statement S1,S2;
@@
x = backlight_device_register(...)
... when != x = E
* if (x != NULL) 
S1 else S2
// </smpl>

Signed-off-by:  Julien Brunel <brunel@diku.dk>
Signed-off-by:  Julia Lawall <julia@diku.dk>

---
 drivers/usb/misc/appledisplay.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
--- a/drivers/usb/misc/appledisplay.c
+++ b/drivers/usb/misc/appledisplay.c
@@ -314,7 +314,7 @@ error:
 					pdata->urbdata, pdata->urb->transfer_dma);
 			usb_free_urb(pdata->urb);
 		}
-		if (pdata->bd)
+		if (pdata->bd && !IS_ERR(pdata->bd))
 			backlight_device_unregister(pdata->bd);
 		kfree(pdata->msgdata);
 	}
