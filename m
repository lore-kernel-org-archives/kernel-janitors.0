From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 13 Sep 2020 07:01:07 +0000
Subject: [PATCH] tulip: windbond-840: Fix a debug message
Message-Id: <20200913070107.352166-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, kuba@kernel.org, hkallweit1@gmail.com, gustavoars@kernel.org, vaibhavgupta40@gmail.com, mst@redhat.com, leon@kernel.org
Cc: linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'w89c840_open()' is incorrectly reported in a debug message. Use __func__
instead.

While at it, fix some style issue in the same function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/dec/tulip/winbond-840.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/winbond-840.c b/drivers/net/ethernet/dec/tulip/winbond-840.c
index 7388e58486a6..89cbdc1f4857 100644
--- a/drivers/net/ethernet/dec/tulip/winbond-840.c
+++ b/drivers/net/ethernet/dec/tulip/winbond-840.c
@@ -630,9 +630,10 @@ static int netdev_open(struct net_device *dev)
 		goto out_err;
 
 	if (debug > 1)
-		netdev_dbg(dev, "w89c840_open() irq %d\n", irq);
+		netdev_dbg(dev, "%s() irq %d\n", __func__, irq);
 
-	if((i=alloc_ringdesc(dev)))
+	i = alloc_ringdesc(dev);
+	if (i)
 		goto out_err;
 
 	spin_lock_irq(&np->lock);
@@ -642,7 +643,7 @@ static int netdev_open(struct net_device *dev)
 
 	netif_start_queue(dev);
 	if (debug > 2)
-		netdev_dbg(dev, "Done netdev_open()\n");
+		netdev_dbg(dev, "Done %s()\n", __func__);
 
 	/* Set the timer to check for link beat. */
 	timer_setup(&np->timer, netdev_timer, 0);
-- 
2.25.1
