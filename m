From: Colin King <colin.king@canonical.com>
Date: Fri, 21 Feb 2020 23:26:53 +0000
Subject: [PATCH] net: ena: ethtool: remove redundant non-zero check on rc
Message-Id: <20200221232653.33134-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netanel Belgazal <netanel@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, Guy Tzalik <gtzalik@amazon.com>, Saeed Bishara <saeedb@amazon.com>, Zorik Machulsky <zorik@amazon.com>, "David S . Miller" <davem@davemloft.net>, Sameeh Jubran <sameehj@amazon.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The non-zero check on rc is redundant as a previous non-zero
check on rc will always return and the second check is never
reached, hence it is redundant and can be removed.  Also
remove a blank line.

Addresses-Coverity: ("Logically dead code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/amazon/ena/ena_ethtool.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_ethtool.c b/drivers/net/ethernet/amazon/ena/ena_ethtool.c
index ced1d577b62a..1e38930353f2 100644
--- a/drivers/net/ethernet/amazon/ena/ena_ethtool.c
+++ b/drivers/net/ethernet/amazon/ena/ena_ethtool.c
@@ -674,7 +674,6 @@ static int ena_get_rxfh(struct net_device *netdev, u32 *indir, u8 *key,
 	 * supports getting/setting the hash function.
 	 */
 	rc = ena_com_get_hash_function(adapter->ena_dev, &ena_func, key);
-
 	if (rc) {
 		if (rc = -EOPNOTSUPP) {
 			key = NULL;
@@ -685,9 +684,6 @@ static int ena_get_rxfh(struct net_device *netdev, u32 *indir, u8 *key,
 		return rc;
 	}
 
-	if (rc)
-		return rc;
-
 	switch (ena_func) {
 	case ENA_ADMIN_TOEPLITZ:
 		func = ETH_RSS_HASH_TOP;
-- 
2.25.0
