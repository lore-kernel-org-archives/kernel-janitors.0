From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 09 Jul 2010 12:31:26 +0000
Subject: [PATCH] at1700: fix double free_irq
Message-Id: <1278678686-7215-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Joe Perches <joe@perches.com>, Stephen Hemminger <shemminger@vyatta.com>, Eric Dumazet <eric.dumazet@gmail.com>, netdev@vger.kernel.org

free_irq() is called both in net_close() and cleanup_card().  Since it
is requested in at1700_probe1(), leave free_irq() only in cleanup_card()
for balance.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/at1700.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/net/at1700.c b/drivers/net/at1700.c
index 93185f5..8987689 100644
--- a/drivers/net/at1700.c
+++ b/drivers/net/at1700.c
@@ -811,10 +811,8 @@ static int net_close(struct net_device *dev)
 	/* No statistic counters on the chip to update. */
 
 	/* Disable the IRQ on boards of fmv18x where it is feasible. */
-	if (lp->jumpered) {
+	if (lp->jumpered)
 		outb(0x00, ioaddr + IOCONFIG1);
-		free_irq(dev->irq, dev);
-	}
 
 	/* Power-down the chip.  Green, green, green! */
 	outb(0x00, ioaddr + CONFIG_1);
-- 
1.7.0.4

