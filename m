From: Colin King <colin.king@canonical.com>
Date: Thu, 12 Mar 2020 14:05:22 +0000
Subject: [PATCH] net: ena: ethtool: clean up minor indentation issue
Message-Id: <20200312140522.1125768-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netanel Belgazal <netanel@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, Guy Tzalik <gtzalik@amazon.com>, Saeed Bishara <saeedb@amazon.com>, Zorik Machulsky <zorik@amazon.com>, "David S . Miller" <davem@davemloft.net>, Sameeh Jubran <sameehj@amazon.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented incorrectly, remove a space.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/amazon/ena/ena_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_ethtool.c b/drivers/net/ethernet/amazon/ena/ena_ethtool.c
index 552d4cbf6dbd..9cc28b4b2627 100644
--- a/drivers/net/ethernet/amazon/ena/ena_ethtool.c
+++ b/drivers/net/ethernet/amazon/ena/ena_ethtool.c
@@ -221,7 +221,7 @@ static void ena_queue_strings(struct ena_adapter *adapter, u8 **data)
 
 			snprintf(*data, ETH_GSTRING_LEN,
 				 "queue_%u_tx_%s", i, ena_stats->name);
-			 (*data) += ETH_GSTRING_LEN;
+			(*data) += ETH_GSTRING_LEN;
 		}
 		/* Rx stats */
 		for (j = 0; j < ENA_STATS_ARRAY_RX; j++) {
-- 
2.25.1
