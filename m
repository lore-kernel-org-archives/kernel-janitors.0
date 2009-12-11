From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Fri, 11 Dec 2009 21:35:38 +0000
Subject: [PATCH 06/10] Fix misspelling of "truly" in a label.
Message-Id: <1260567342-8327-7-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

A label reads 'truely_dead' rather than 'truly_dead'; this fixes it.
No change in functionality.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 drivers/net/typhoon.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/typhoon.c b/drivers/net/typhoon.c
index 5921f5b..13cc3b8 100644
--- a/drivers/net/typhoon.c
+++ b/drivers/net/typhoon.c
@@ -2113,7 +2113,7 @@ typhoon_tx_timeout(struct net_device *dev)
 	if(typhoon_reset(tp->ioaddr, WaitNoSleep) < 0) {
 		printk(KERN_WARNING "%s: could not reset in tx timeout\n",
 					dev->name);
-		goto truely_dead;
+		goto truly_dead;
 	}
 
 	/* If we ever start using the Hi ring, it will need cleaning too */
@@ -2123,13 +2123,13 @@ typhoon_tx_timeout(struct net_device *dev)
 	if(typhoon_start_runtime(tp) < 0) {
 		printk(KERN_ERR "%s: could not start runtime in tx timeout\n",
 					dev->name);
-		goto truely_dead;
+		goto truly_dead;
         }
 
 	netif_wake_queue(dev);
 	return;
 
-truely_dead:
+truly_dead:
 	/* Reset the hardware, and turn off carrier to avoid more timeouts */
 	typhoon_reset(tp->ioaddr, NoWait);
 	netif_carrier_off(dev);
-- 
1.6.3.3

