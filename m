From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 Oct 2018 08:02:39 +0000
Subject: [PATCH net-next] bnxt_en: Copy and paste bug in extended tx_stats
Message-Id: <20181018080239.z2egoh4bw4beb3r3@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Chan <michael.chan@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The struct type was copied from the line before but it should be "tx"
instead of "rx".  I have reviewed the code and I can't immediately see
that this bug causes a runtime issue.

Fixes: 36e53349b60b ("bnxt_en: Add additional extended port statistics.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is from static analysis and I don't have a way to test it.

 drivers/net/ethernet/broadcom/bnxt/bnxt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index 0fe57e36912b..498b373c992d 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -1471,7 +1471,7 @@ struct bnxt {
 	struct rx_port_stats	*hw_rx_port_stats;
 	struct tx_port_stats	*hw_tx_port_stats;
 	struct rx_port_stats_ext	*hw_rx_port_stats_ext;
-	struct rx_port_stats_ext	*hw_tx_port_stats_ext;
+	struct tx_port_stats_ext	*hw_tx_port_stats_ext;
 	dma_addr_t		hw_rx_port_stats_map;
 	dma_addr_t		hw_tx_port_stats_map;
 	dma_addr_t		hw_rx_port_stats_ext_map;
-- 
2.11.0
