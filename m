From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 26 Sep 2010 09:58:00 +0000
Subject: [PATCH 1/9] ibm_newemac: use free_netdev(netdev) instead of kfree()
Message-Id: <1285495080-21857-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jiri Pirko <jpirko-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>

Freeing netdev without free_netdev() leads to net, tx leaks.
I might lead to dereferencing freed pointer.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

@@
struct net_device* dev;
@@

-kfree(dev)
+free_netdev(dev)
---
 drivers/net/ibm_newemac/core.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ibm_newemac/core.c b/drivers/net/ibm_newemac/core.c
index 3506fd6..519e19e 100644
--- a/drivers/net/ibm_newemac/core.c
+++ b/drivers/net/ibm_newemac/core.c
@@ -2928,7 +2928,7 @@ static int __devinit emac_probe(struct platform_device *ofdev,
 	if (dev->emac_irq != NO_IRQ)
 		irq_dispose_mapping(dev->emac_irq);
  err_free:
-	kfree(ndev);
+	free_netdev(ndev);
  err_gone:
 	/* if we were on the bootlist, remove us as we won't show up and
 	 * wake up all waiters to notify them in case they were waiting
@@ -2971,7 +2971,7 @@ static int __devexit emac_remove(struct platform_device *ofdev)
 	if (dev->emac_irq != NO_IRQ)
 		irq_dispose_mapping(dev->emac_irq);
 
-	kfree(dev->ndev);
+	free_netdev(dev->ndev);
 
 	return 0;
 }
-- 
1.7.0.4

