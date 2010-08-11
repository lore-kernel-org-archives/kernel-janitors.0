From: Julia Lawall <julia@diku.dk>
Date: Wed, 11 Aug 2010 10:11:07 +0000
Subject: [PATCH 2/5] drivers/dma: Return -ENOMEM on memory allocation failure
Message-Id: <Pine.LNX.4.64.1008111210490.8669@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Julia Lawall <julia@diku.dk>

In this code, 0 is returned on memory allocation failure, even though other
failures return -ENOMEM or other similar values.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression ret;
expression x,e1,e2,e3;
@@

ret = 0
... when != ret = e1
*x = \(kmalloc\|kcalloc\|kzalloc\)(...)
... when != ret = e2
if (x = NULL) { ... when != ret = e3
  return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/dma/coh901318.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/coh901318.c b/drivers/dma/coh901318.c
index 557e227..6dd9488 100644
--- a/drivers/dma/coh901318.c
+++ b/drivers/dma/coh901318.c
@@ -1475,8 +1475,10 @@ static int __init coh901318_probe(struct platform_device *pdev)
 		       pdata->max_channels *
 		       sizeof(struct coh901318_chan),
 		       GFP_KERNEL);
-	if (!base)
+	if (!base) {
+		err = -ENOMEM;
 		goto err_alloc_coh_dma_channels;
+	}
 
 	base->chans = ((void *)base) + ALIGN(sizeof(struct coh901318_base), 4);
 
