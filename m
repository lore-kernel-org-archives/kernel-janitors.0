From: Colin King <colin.king@canonical.com>
Date: Wed, 19 Jun 2019 16:45:17 +0000
Subject: [PATCH] can: xilinx_can: clean up indentation issue
Message-Id: <20190619164518.5683-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, "David S . Miller" <davem@davemloft.net>, Michal Simek <michal.simek@xilinx.com>, linux-can@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A statement is indented one level too deep, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/can/xilinx_can.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/xilinx_can.c b/drivers/net/can/xilinx_can.c
index 63203ff452b5..a3940141555c 100644
--- a/drivers/net/can/xilinx_can.c
+++ b/drivers/net/can/xilinx_can.c
@@ -924,7 +924,7 @@ static void xcan_err_interrupt(struct net_device *ndev, u32 isr)
 				cf->data[3] = CAN_ERR_PROT_LOC_CRC_SEQ;
 			}
 		}
-			priv->can.can_stats.bus_error++;
+		priv->can.can_stats.bus_error++;
 	}
 
 	if (skb) {
-- 
2.20.1
