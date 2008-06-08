From: Julia Lawall <julia@diku.dk>
Date: Sun, 08 Jun 2008 12:58:49 +0000
Subject: [PATCH] drivers/input/tablet/gtco.c: eliminate early return
Message-Id: <Pine.LNX.4.64.0806081458190.10294@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

There seems to be no reason why this error case should do less cleaning up
than the other adjacent ones, so the goto, which is currently dead code,
seems to be what is intended.


Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/drivers/input/tablet/gtco.c b/drivers/input/tablet/gtco.c
--- a/drivers/input/tablet/gtco.c
+++ b/drivers/input/tablet/gtco.c
@@ -863,7 +863,7 @@ static int gtco_probe(struct usb_interfa
 	gtco->urbinfo = usb_alloc_urb(0, GFP_KERNEL);
 	if (!gtco->urbinfo) {
 		err("Failed to allocate URB");
-		return -ENOMEM;
+		error = -ENOMEM;
 		goto err_free_buf;
 	}
 
