From: Colin King <colin.king@canonical.com>
Date: Tue, 27 Nov 2018 14:00:15 +0000
Subject: [PATCH] liquidio: fix spelling mistake "deferal" -> "deferral"
Message-Id: <20181127140015.26409-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <derek.chickles@caviumnetworks.com>, Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the oct_stats_strings array, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/cavium/liquidio/lio_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c b/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c
index 4c3925af53bc..abe5d0dac851 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c
@@ -111,7 +111,7 @@ static const char oct_stats_strings[][ETH_GSTRING_LEN] = {
 	"mac_tx_one_collision",
 	"mac_tx_multi_collision",
 	"mac_tx_max_collision_fail",
-	"mac_tx_max_deferal_fail",
+	"mac_tx_max_deferral_fail",
 	"mac_tx_fifo_err",
 	"mac_tx_runts",
 
-- 
2.19.1
