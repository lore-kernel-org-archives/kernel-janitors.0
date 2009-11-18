From: Julia Lawall <julia@diku.dk>
Date: Wed, 18 Nov 2009 18:21:45 +0000
Subject: [PATCH 4/16] drivers/net/ipg.c: remove exceptional & on function
Message-Id: <Pine.LNX.4.64.0911181921050.20943@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francois Romieu <romieu@fr.zoreil.com>, Sorbica Shieh <sorbica@icplus.com.tw>, Jesse Huang <jesse@icplus.com.tw>, netdev@vger.kernel.org, arnd@arndb.de, joe@perches.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/net/ipg.c                   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ipg.c b/drivers/net/ipg.c
index 63056e7..ba8d246 100644
--- a/drivers/net/ipg.c
+++ b/drivers/net/ipg.c
@@ -1751,7 +1751,7 @@ static int ipg_nic_open(struct net_device *dev)
 	/* Register the interrupt line to be used by the IPG within
 	 * the Linux system.
 	 */
-	rc = request_irq(pdev->irq, &ipg_interrupt_handler, IRQF_SHARED,
+	rc = request_irq(pdev->irq, ipg_interrupt_handler, IRQF_SHARED,
 			 dev->name, dev);
 	if (rc < 0) {
 		printk(KERN_INFO "%s: Error when requesting interrupt.\n",
