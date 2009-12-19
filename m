From: Julia Lawall <julia@diku.dk>
Date: Sat, 19 Dec 2009 07:30:10 +0000
Subject: [PATCH 1/2] drivers/block: drop unnecesary memset
Message-Id: <Pine.LNX.4.64.0912190829470.30546@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Miller <mike.miller@hp.com>, iss_storagedev@hp.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

memset of 0 is not needed after kzalloc

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
statement S;
@@

x = kzalloc(...);
if (x = NULL) S
... when != x
-memset(x,0,...);// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/block/cciss.c |    1 -
 1 file changed, 1 deletion(-)

diff -u -p a/drivers/block/cciss.c b/drivers/block/cciss.c
--- a/drivers/block/cciss.c
+++ b/drivers/block/cciss.c
@@ -4379,7 +4379,6 @@ static void cciss_shutdown(struct pci_de
 		return;
 	}
 	/* write all data in the battery backed cache to disk */
-	memset(flush_buf, 0, 4);
 	return_code = sendcmd_withirq(CCISS_CACHE_FLUSH, h->ctlr, flush_buf,
 		4, 0, CTLR_LUNID, TYPE_CMD);
 	kfree(flush_buf);
