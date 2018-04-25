From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Apr 2018 10:31:13 +0000
Subject: [PATCH] net: amd8111e: remove redundant duplicated if statement
Message-Id: <20180425103113.8013-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180301164240.18014-1-colin.king@canonical.com>
In-Reply-To: <20180301164240.18014-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Allen Pais <allen.lkml@gmail.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two identical nested if statements, the second is redundant
and can be removed. Also clean up white space formatting.

Cleans up cppcheck warning:
drivers/net/ethernet/amd/amd8111e.c:1080: (warning) Identical inner 'if'
condition is always true.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/amd/amd8111e.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/amd/amd8111e.c b/drivers/net/ethernet/amd/amd8111e.c
index c99e3e845ac0..a90080f12e67 100644
--- a/drivers/net/ethernet/amd/amd8111e.c
+++ b/drivers/net/ethernet/amd/amd8111e.c
@@ -1074,16 +1074,12 @@ static int amd8111e_calc_coalesce(struct net_device *dev)
 				amd8111e_set_coalesce(dev,TX_INTR_COAL);
 				coal_conf->tx_coal_type = MEDIUM_COALESCE;
 			}
-
-		}
-		else if(tx_pkt_size >= 1024){
-			if (tx_pkt_size >= 1024){
-				if(coal_conf->tx_coal_type !=  HIGH_COALESCE){
-					coal_conf->tx_timeout = 4;
-					coal_conf->tx_event_count = 8;
-					amd8111e_set_coalesce(dev,TX_INTR_COAL);
-					coal_conf->tx_coal_type = HIGH_COALESCE;
-				}
+		} else if (tx_pkt_size >= 1024) {
+			if (coal_conf->tx_coal_type != HIGH_COALESCE) {
+				coal_conf->tx_timeout = 4;
+				coal_conf->tx_event_count = 8;
+				amd8111e_set_coalesce(dev, TX_INTR_COAL);
+				coal_conf->tx_coal_type = HIGH_COALESCE;
 			}
 		}
 	}
-- 
2.17.0

