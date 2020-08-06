From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Aug 2020 10:56:16 +0000
Subject: [PATCH] can: grcan: fix spelling mistake "buss" -> "bus"
Message-Id: <20200806105616.46790-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-can@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a netdev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/can/grcan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
index 378200b682fa..5d1f15843181 100644
--- a/drivers/net/can/grcan.c
+++ b/drivers/net/can/grcan.c
@@ -726,7 +726,7 @@ static void grcan_err(struct net_device *dev, u32 sources, u32 status)
 			txrx = "on rx ";
 			stats->rx_errors++;
 		}
-		netdev_err(dev, "Fatal AHB buss error %s- halting device\n",
+		netdev_err(dev, "Fatal AHB bus error %s- halting device\n",
 			   txrx);
 
 		spin_lock_irqsave(&priv->lock, flags);
-- 
2.27.0
