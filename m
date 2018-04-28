From: Colin King <colin.king@canonical.com>
Date: Sat, 28 Apr 2018 09:52:16 +0000
Subject: [PATCH] liquidio: fix spelling mistake: "mac_tx_multi_collison" -> "mac_tx_multi_collision"
Message-Id: <20180428095216.7236-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <derek.chickles@caviumnetworks.com>, Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in oct_stats_strings text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/cavium/liquidio/lio_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c b/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c
index 9926a12dd805..000e7d40e2ad 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c
@@ -120,7 +120,7 @@ static const char oct_stats_strings[][ETH_GSTRING_LEN] = {
 	"mac_tx_ctl_packets",
 	"mac_tx_total_collisions",
 	"mac_tx_one_collision",
-	"mac_tx_multi_collison",
+	"mac_tx_multi_collision",
 	"mac_tx_max_collision_fail",
 	"mac_tx_max_deferal_fail",
 	"mac_tx_fifo_err",
-- 
2.17.0

