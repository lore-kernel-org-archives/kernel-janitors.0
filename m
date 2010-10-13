From: Dan Carpenter <error27@gmail.com>
Date: Wed, 13 Oct 2010 19:18:53 +0000
Subject: [patch] ns83820: spin_lock_irq() => spin_lock()
Message-Id: <20101013191852.GD6060@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org, mingo@elte.hu

This is essentially cosmetic.  At this point the IRQs are already
disabled because we called spin_lock_irq(&dev->rx_info.lock).

The real bug here was fixed back in 2006 in 3a10ccebe: "[PATCH] lock
validator: fix ns83820.c irq-flags bug".  Prior to that patch, it was
a "spin_lock_irq is not nestable" type bug.  The 2006 patch changes the
unlock to not re-enable IRQs, which eliminates the potential deadlock.

But this bit was missed.  We should change the lock function as well so
it balances nicely.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/ns83820.c b/drivers/net/ns83820.c
index 3bbd0aa..84134c7 100644
--- a/drivers/net/ns83820.c
+++ b/drivers/net/ns83820.c
@@ -772,7 +772,7 @@ static int ns83820_setup_rx(struct net_device *ndev)
 		phy_intr(ndev);
 
 		/* Okay, let it rip */
-		spin_lock_irq(&dev->misc_lock);
+		spin_lock(&dev->misc_lock);
 		dev->IMR_cache |= ISR_PHY;
 		dev->IMR_cache |= ISR_RXRCMP;
 		//dev->IMR_cache |= ISR_RXERR;
