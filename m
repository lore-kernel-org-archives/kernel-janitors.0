From: Dan Carpenter <error27@gmail.com>
Date: Fri, 15 Oct 2010 03:40:42 +0000
Subject: [patch 1/2] Staging: ft1000-usb: use the correct list head
Message-Id: <20101015034042.GF6614@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Using pdpram_blk here would cause an oops.  We intended to use
&freercvpool.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c b/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c
index d0637c3..076ba75 100644
--- a/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c
+++ b/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c
@@ -1115,7 +1115,7 @@ u16 init_ft1000_netdev(struct ft1000_device *ft1000dev)
 
 
 err_free:
-	list_for_each_safe(cur, tmp, &pdpram_blk->list) {
+	list_for_each_safe(cur, tmp, &freercvpool) {
 		pdpram_blk = list_entry(cur, DPRAM_BLK, list);
 		list_del(&pdpram_blk->list);
 		kfree(pdpram_blk->pbuffer);
