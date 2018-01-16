From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 16 Jan 2018 10:38:59 +0000
Subject: [PATCH net-next] bnxt_en: uninitialized variable in bnxt_rx_pkt()
Message-Id: <20180116103859.GA3374@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Chan <michael.chan@broadcom.com>, Andy Gospodarek <gospo@broadcom.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There are a couple failure paths where "len" is used uninitialized.  It
means we record the number of rx_packets incorrectly.

Fixes: 6a8788f25625 ("bnxt_en: add support for software dynamic interrupt moderation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index cf6ebf1e324b..5b5c4f266f1b 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -1482,7 +1482,7 @@ static int bnxt_rx_pkt(struct bnxt *bp, struct bnxt_napi *bnapi, u32 *raw_cons,
 	u32 tmp_raw_cons = *raw_cons;
 	u16 cfa_code, cons, prod, cp_cons = RING_CMP(tmp_raw_cons);
 	struct bnxt_sw_rx_bd *rx_buf;
-	unsigned int len;
+	unsigned int len = 0;
 	u8 *data_ptr, agg_bufs, cmp_type;
 	dma_addr_t dma_addr;
 	struct sk_buff *skb;
