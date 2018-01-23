From: Colin King <colin.king@canonical.com>
Date: Tue, 23 Jan 2018 09:44:08 +0000
Subject: [PATCH] bnx2: remove redundant initializations of pointers txr and rxr
Message-Id: <20180123094408.30366-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rasesh Mody <rasesh.mody@cavium.com>, Harish Patil <harish.patil@cavium.com>, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointers txr and rxr are being initialized and a few statements later
are being assigned new values without the original values ever being
read. The initialized values are therefore redundant and can be
removed.

Cleans up clang warnings:
drivers/net/ethernet/broadcom/bnx2.c:5821:28: warning: Value stored to
'txr' during its initialization is never read
drivers/net/ethernet/broadcom/bnx2.c:5822:28: warning: Value stored to
'rxr' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/broadcom/bnx2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnx2.c b/drivers/net/ethernet/broadcom/bnx2.c
index 154866e8517a..5de4c33f682e 100644
--- a/drivers/net/ethernet/broadcom/bnx2.c
+++ b/drivers/net/ethernet/broadcom/bnx2.c
@@ -5818,8 +5818,8 @@ bnx2_run_loopback(struct bnx2 *bp, int loopback_mode)
 	struct l2_fhdr *rx_hdr;
 	int ret = -ENODEV;
 	struct bnx2_napi *bnapi = &bp->bnx2_napi[0], *tx_napi;
-	struct bnx2_tx_ring_info *txr = &bnapi->tx_ring;
-	struct bnx2_rx_ring_info *rxr = &bnapi->rx_ring;
+	struct bnx2_tx_ring_info *txr;
+	struct bnx2_rx_ring_info *rxr;
 
 	tx_napi = bnapi;
 
-- 
2.15.1

