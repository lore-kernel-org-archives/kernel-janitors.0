From: Julia Lawall <julia@diku.dk>
Date: Wed, 18 Nov 2009 18:23:53 +0000
Subject: [PATCH 10/16] drivers/net/via-rhine.c: remove exceptional & on
Message-Id: <Pine.LNX.4.64.0911181923340.20943@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roger Luethi <rl@hellgate.ch>, netdev@vger.kernel.org, arnd@arndb.de, joe@perches.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In this file, function names are otherwise used as pointers without &.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier f;
@@

f(...) { ... }

@@
identifier r.f;
@@

- &f
+ f
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/via-rhine.c             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/via-rhine.c b/drivers/net/via-rhine.c
index 4535e89..ec94ddf 100644
--- a/drivers/net/via-rhine.c
+++ b/drivers/net/via-rhine.c
@@ -1150,7 +1150,7 @@ static int rhine_open(struct net_device *dev)
 	void __iomem *ioaddr = rp->base;
 	int rc;
 
-	rc = request_irq(rp->pdev->irq, &rhine_interrupt, IRQF_SHARED, dev->name,
+	rc = request_irq(rp->pdev->irq, rhine_interrupt, IRQF_SHARED, dev->name,
 			dev);
 	if (rc)
 		return rc;
