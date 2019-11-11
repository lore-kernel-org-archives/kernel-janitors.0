From: Colin King <colin.king@canonical.com>
Date: Mon, 11 Nov 2019 12:44:13 +0000
Subject: [PATCH][next] cxgb4: remove redundant assignment to hdr_len
Message-Id: <20191111124413.68782-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180910121722.15524-1-colin.king@canonical.com>
In-Reply-To: <20180910121722.15524-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable hdr_len is being assigned a value that is never read.
The assignment is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/chelsio/cxgb4/sge.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c b/drivers/net/ethernet/chelsio/cxgb4/sge.c
index e346830ebca9..09059adc3067 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -3810,7 +3810,6 @@ int cxgb4_ethofld_rx_handler(struct sge_rspq *q, const __be64 *rsp,
 				      eosw_txq->state =
 				      CXGB4_EO_STATE_FLOWC_CLOSE_REPLY) &&
 				     eosw_txq->cidx = eosw_txq->flowc_idx)) {
-				hdr_len = skb->len;
 				flits = DIV_ROUND_UP(skb->len, 8);
 				if (eosw_txq->state =
 				    CXGB4_EO_STATE_FLOWC_OPEN_REPLY)
-- 
2.20.1
