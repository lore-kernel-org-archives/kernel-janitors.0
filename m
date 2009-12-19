From: Julia Lawall <julia@diku.dk>
Date: Sat, 19 Dec 2009 07:30:30 +0000
Subject: [PATCH 2/2] drivers/dma: drop unnecesary memset
Message-Id: <Pine.LNX.4.64.0912190830110.30546@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Maciej Sosnowski <maciej.sosnowski@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/dma/dw_dmac.c |    2 --
 1 file changed, 2 deletions(-)

diff -u -p a/drivers/dma/dw_dmac.c b/drivers/dma/dw_dmac.c
--- a/drivers/dma/dw_dmac.c
+++ b/drivers/dma/dw_dmac.c
@@ -1270,8 +1270,6 @@ static int __init dw_probe(struct platfo
 		goto err_kfree;
 	}
 
-	memset(dw, 0, sizeof *dw);
-
 	dw->regs = ioremap(io->start, DW_REGLEN);
 	if (!dw->regs) {
 		err = -ENOMEM;
