From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Jan 2018 10:22:50 +0000
Subject: [PATCH] bnxt_en: don't update cpr->rx_bytes with uninitialized length len
Message-Id: <20180116102250.22914-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Chan <michael.chan@broadcom.com>, netdev@vger.kernel.org, andrew.gospodarek@broadcom.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently in the cases where cmp_type = CMP_TYPE_RX_L2_TPA_START_CMP or
CMP_TYPE_RX_L2_TPA_END_CMP the exit path updates cpr->rx_bytes with an
uninitialized length len.  Fix this by adding a new exit path that does
not update the cpr stats with the bogus length len and remove the unused
label next_rx_no_prod.

Detected by CoverityScan, CID#1463807 ("Uninitialized scalar variable")
Fixes: 6a8788f25625 ("bnxt_en: add support for software dynamic interrupt moderation")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index cf6ebf1e324b..6b2a7fe0dbde 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -1510,7 +1510,7 @@ static int bnxt_rx_pkt(struct bnxt *bp, struct bnxt_napi *bnapi, u32 *raw_cons,
 			       (struct rx_tpa_start_cmp_ext *)rxcmp1);
 
 		*event |= BNXT_RX_EVENT;
-		goto next_rx_no_prod;
+		goto next_rx_no_prod_no_len;
 
 	} else if (cmp_type = CMP_TYPE_RX_L2_TPA_END_CMP) {
 		skb = bnxt_tpa_end(bp, bnapi, &tmp_raw_cons,
@@ -1526,7 +1526,7 @@ static int bnxt_rx_pkt(struct bnxt *bp, struct bnxt_napi *bnapi, u32 *raw_cons,
 			rc = 1;
 		}
 		*event |= BNXT_RX_EVENT;
-		goto next_rx_no_prod;
+		goto next_rx_no_prod_no_len;
 	}
 
 	cons = rxcmp->rx_cmp_opaque;
@@ -1644,9 +1644,10 @@ static int bnxt_rx_pkt(struct bnxt *bp, struct bnxt_napi *bnapi, u32 *raw_cons,
 	rxr->rx_prod = NEXT_RX(prod);
 	rxr->rx_next_cons = NEXT_RX(cons);
 
-next_rx_no_prod:
 	cpr->rx_packets += 1;
 	cpr->rx_bytes += len;
+
+next_rx_no_prod_no_len:
 	*raw_cons = tmp_raw_cons;
 
 	return rc;
-- 
2.15.1

