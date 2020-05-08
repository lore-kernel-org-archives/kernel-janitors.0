From: Colin King <colin.king@canonical.com>
Date: Fri, 08 May 2020 22:58:10 +0000
Subject: [PATCH] net: lio_core: remove redundant assignment to variable tx_done
Message-Id: <20200508225810.484331-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <dchickles@marvell.com>, Satanand Burla <sburla@marvell.com>, Felix Manlunas <fmanlunas@marvell.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable tx_done is being assigned with a value that is never read
as the function returns a few statements later.  The assignment is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/cavium/liquidio/lio_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/cavium/liquidio/lio_core.c b/drivers/net/ethernet/cavium/liquidio/lio_core.c
index d7e805749a5b..e40c64b79f66 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_core.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_core.c
@@ -782,7 +782,6 @@ static int liquidio_napi_poll(struct napi_struct *napi, int budget)
 	if ((work_done < budget && tx_done) ||
 	    (iq && iq->pkt_in_done >= MAX_REG_CNT) ||
 	    (droq->pkt_count >= MAX_REG_CNT)) {
-		tx_done = 1;
 		napi_complete_done(napi, work_done);
 
 		octeon_enable_irq(droq->oct_dev, droq->q_no);
-- 
2.25.1
