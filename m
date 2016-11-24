From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2016 11:26:49 +0000
Subject: [patch -next] cxgb4: leak on error path in setup_sge_txq_uld()
Message-Id: <20161124112649.GM17225@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hariprasad S <hariprasad@chelsio.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Freeing "txq_info->uldtxq" is a no-op.  We intended to free "txq_info".

Fixes: ab677ff4ad15 ("cxgb4: Allocate Tx queues dynamically")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c
index 565a6c6..8098902 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c
@@ -532,7 +532,7 @@ setup_sge_txq_uld(struct adapter *adap, unsigned int uld_type,
 	txq_info->uldtxq = kcalloc(txq_info->ntxq, sizeof(struct sge_uld_txq),
 				   GFP_KERNEL);
 	if (!txq_info->uldtxq) {
-		kfree(txq_info->uldtxq);
+		kfree(txq_info);
 		return -ENOMEM;
 	}
 
