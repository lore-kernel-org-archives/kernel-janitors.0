From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:14:04 +0000
Subject: [PATCH 09/43] drivers/net/r6040.c: fix sparse warning: Using plain
Message-Id: <20090214211400.23489.24726.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:
  drivers/net/r6040.c:487:31: warning: Using plain integer as NULL pointer
  drivers/net/r6040.c:492:31: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/r6040.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/r6040.c b/drivers/net/r6040.c
index 3c27a7b..9c95ebe 100644
--- a/drivers/net/r6040.c
+++ b/drivers/net/r6040.c
@@ -484,12 +484,12 @@ static int r6040_close(struct net_device *dev)
 	/* Free Descriptor memory */
 	if (lp->rx_ring) {
 		pci_free_consistent(pdev, RX_DESC_SIZE, lp->rx_ring, lp->rx_ring_dma);
-		lp->rx_ring = 0;
+		lp->rx_ring = NULL;
 	}
 
 	if (lp->tx_ring) {
 		pci_free_consistent(pdev, TX_DESC_SIZE, lp->tx_ring, lp->tx_ring_dma);
-		lp->tx_ring = 0;
+		lp->tx_ring = NULL;
 	}
 
 	return 0;

