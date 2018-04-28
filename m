From: Colin King <colin.king@canonical.com>
Date: Sat, 28 Apr 2018 09:57:07 +0000
Subject: [PATCH] net: ethernet: ucc: fix spelling mistake: "tx-late-collsion" -> "tx-late-collision"
Message-Id: <20180428095707.7424-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Li Yang <leoyang.li@nxp.com>, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in tx_fw_stat_gstrings text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/freescale/ucc_geth_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
index 4df282ed22c7..0beee2cc2ddd 100644
--- a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
+++ b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
@@ -61,7 +61,7 @@ static const char hw_stat_gstrings[][ETH_GSTRING_LEN] = {
 static const char tx_fw_stat_gstrings[][ETH_GSTRING_LEN] = {
 	"tx-single-collision",
 	"tx-multiple-collision",
-	"tx-late-collsion",
+	"tx-late-collision",
 	"tx-aborted-frames",
 	"tx-lost-frames",
 	"tx-carrier-sense-errors",
-- 
2.17.0

