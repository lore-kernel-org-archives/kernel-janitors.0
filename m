From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:38:08 +0000
Subject: [PATCH 23/43] drivers/net/igb: fix sparse warning: symbol shadows an
Message-Id: <20090214213628.24377.69119.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Move variable declaration as far inner as possible.

Fix this sparse warning:
  drivers/net/igb/igb_main.c:1895:21: warning: symbol 'j' shadows an earlier one
  drivers/net/igb/igb_main.c:1855:16: originally declared here

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/igb/igb_main.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/igb/igb_main.c b/drivers/net/igb/igb_main.c
index f8c2919..1885e20 100644
--- a/drivers/net/igb/igb_main.c
+++ b/drivers/net/igb/igb_main.c
@@ -1852,7 +1852,7 @@ static void igb_configure_rx(struct igb_adapter *adapter)
 	struct e1000_hw *hw = &adapter->hw;
 	u32 rctl, rxcsum;
 	u32 rxdctl;
-	int i, j;
+	int i;
 
 	/* disable receives while setting up the descriptors */
 	rctl = rd32(E1000_RCTL);
@@ -1867,7 +1867,7 @@ static void igb_configure_rx(struct igb_adapter *adapter)
 	 * the Base and Length of the Rx Descriptor Ring */
 	for (i = 0; i < adapter->num_rx_queues; i++) {
 		struct igb_ring *ring = &(adapter->rx_ring[i]);
-		j = ring->reg_idx;
+		int j = ring->reg_idx;
 		rdba = ring->dma;
 		wr32(E1000_RDBAL(j),
 				rdba & 0x00000000ffffffffULL);

