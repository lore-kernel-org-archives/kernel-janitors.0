From: Colin King <colin.king@canonical.com>
Date: Fri, 11 Oct 2019 17:22:32 +0000
Subject: [PATCH] net: b44: remove redundant assignment to variable reg
Message-Id: <20191011172232.14430-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Chan <michael.chan@broadcom.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable reg is being assigned a value that is never read
and is being re-assigned in the following for-loop. The
assignment is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/broadcom/b44.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/b44.c b/drivers/net/ethernet/broadcom/b44.c
index 97ab0dd25552..035dbb1b2c98 100644
--- a/drivers/net/ethernet/broadcom/b44.c
+++ b/drivers/net/ethernet/broadcom/b44.c
@@ -511,9 +511,6 @@ static void b44_stats_update(struct b44 *bp)
 		*val++ += br32(bp, reg);
 	}
 
-	/* Pad */
-	reg += 8*4UL;
-
 	for (reg = B44_RX_GOOD_O; reg <= B44_RX_NPAUSE; reg += 4UL) {
 		*val++ += br32(bp, reg);
 	}
-- 
2.20.1
