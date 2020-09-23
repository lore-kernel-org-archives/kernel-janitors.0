From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Sep 2020 11:27:52 +0000
Subject: [PATCH net-next] can: mcp25xxfd: fix a leak in mcp25xxfd_ring_free()
Message-Id: <20200923112752.GA1473821@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Thomas Kopp <thomas.kopp@microchip.com>, Wolfgang Grandegger <wg@grandegger.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-can@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This loop doesn't free the first element of the array.  The "i > 0" has
to be changed to "i >= 0".

Fixes: 55e5b97f003e ("can: mcp25xxfd: add driver for Microchip MCP25xxFD SPI CAN")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd-core.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd-core.c
index bd2ba981ae36..7e094afaac04 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd-core.c
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd-core.c
@@ -377,7 +377,7 @@ static void mcp25xxfd_ring_free(struct mcp25xxfd_priv *priv)
 {
 	int i;
 
-	for (i = ARRAY_SIZE(priv->rx) - 1; i > 0; i--) {
+	for (i = ARRAY_SIZE(priv->rx) - 1; i >= 0; i--) {
 		kfree(priv->rx[i]);
 		priv->rx[i] = NULL;
 	}
-- 
2.28.0
