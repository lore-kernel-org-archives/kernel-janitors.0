From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Apr 2018 19:09:25 +0000
Subject: [PATCH] net: systemport: fix spelling mistake: "asymetric" -> "asymmetric"
Message-Id: <20180427190925.17097-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in netdev_warn warning message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/broadcom/bcmsysport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
index effc651a2a2f..54ad1171e75e 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.c
+++ b/drivers/net/ethernet/broadcom/bcmsysport.c
@@ -2178,7 +2178,7 @@ static int bcm_sysport_map_queues(struct net_device *dev,
 
 	if (priv->per_port_num_tx_queues &&
 	    priv->per_port_num_tx_queues != num_tx_queues)
-		netdev_warn(slave_dev, "asymetric number of per-port queues\n");
+		netdev_warn(slave_dev, "asymmetric number of per-port queues\n");
 
 	priv->per_port_num_tx_queues = num_tx_queues;
 
-- 
2.17.0

