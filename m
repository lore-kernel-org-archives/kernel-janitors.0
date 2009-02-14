From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:11:55 +0000
Subject: [PATCH 01/43] drivers/net/at1700.c: fix sparse warning: symbol
Message-Id: <20090214211144.23489.88144.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Move variable declaration to a more inner scope.

Fix this sparse warning:
  drivers/net/at1700.c:846:21: warning: symbol 'i' shadows an earlier one
  drivers/net/at1700.c:831:13: originally declared here

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/at1700.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/at1700.c b/drivers/net/at1700.c
index 72ea6e3..ced7079 100644
--- a/drivers/net/at1700.c
+++ b/drivers/net/at1700.c
@@ -828,7 +828,6 @@ set_rx_mode(struct net_device *dev)
 	struct net_local *lp = netdev_priv(dev);
 	unsigned char mc_filter[8];		 /* Multicast hash filter */
 	unsigned long flags;
-	int i;
 
 	if (dev->flags & IFF_PROMISC) {
 		memset(mc_filter, 0xff, sizeof(mc_filter));
@@ -857,6 +856,7 @@ set_rx_mode(struct net_device *dev)
 
 	spin_lock_irqsave (&lp->lock, flags);
 	if (memcmp(mc_filter, lp->mc_filter, sizeof(mc_filter))) {
+		int i;
 		int saved_bank = inw(ioaddr + CONFIG_0);
 		/* Switch to bank 1 and set the multicast table. */
 		outw((saved_bank & ~0x0C00) | 0x0480, ioaddr + CONFIG_0);

