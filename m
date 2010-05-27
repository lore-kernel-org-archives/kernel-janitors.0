From: Julia Lawall <julia@diku.dk>
Date: Thu, 27 May 2010 12:33:32 +0000
Subject: [PATCH 6/11] drivers/net: Eliminate a NULL pointer dereference
Message-Id: <Pine.LNX.4.64.1005271433180.5422@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

At the point of the print, dev is NULL.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
expression E,E1;
identifier f;
statement S1,S2,S3;
@@

if ((E = NULL && ...) || ...)
{
  ... when != if (...) S1 else S2
      when != E = E1
* E->f
  ... when any
  return ...;
}
else S3
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/3c507.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/3c507.c b/drivers/net/3c507.c
index 82eaf65..ea9b7a0 100644
--- a/drivers/net/3c507.c
+++ b/drivers/net/3c507.c
@@ -551,8 +551,7 @@ static irqreturn_t el16_interrupt(int irq, void *dev_id)
 	void __iomem *shmem;
 
 	if (dev = NULL) {
-		pr_err("%s: net_interrupt(): irq %d for unknown device.\n",
-			dev->name, irq);
+		pr_err("net_interrupt(): irq %d for unknown device.\n", irq);
 		return IRQ_NONE;
 	}
 
