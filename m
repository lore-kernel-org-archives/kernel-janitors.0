From: Julia Lawall <julia@diku.dk>
Date: Tue, 22 Dec 2009 20:30:59 +0000
Subject: [PATCH 1/6] drivers/dma: Correct use after free
Message-Id: <Pine.LNX.4.64.0912222130370.28669@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Maciej Sosnowski <maciej.sosnowski@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Move the kfree after the iounmap that refers to the same structure.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,e;
identifier f;
iterator I;
statement S;
@@

*kfree(x);
... when != &x
    when != x = e
    when != I(x,...) S
*x->f
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/dma/coh901318.c             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/dma/coh901318.c b/drivers/dma/coh901318.c
index 4a99cd9..b5f2ee0 100644
--- a/drivers/dma/coh901318.c
+++ b/drivers/dma/coh901318.c
@@ -1294,8 +1294,8 @@ static int __exit coh901318_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&base->dma_slave);
 	coh901318_pool_destroy(&base->pool);
 	free_irq(platform_get_irq(pdev, 0), base);
-	kfree(base);
 	iounmap(base->virtbase);
+	kfree(base);
 	release_mem_region(pdev->resource->start,
 			   resource_size(pdev->resource));
 	return 0;
