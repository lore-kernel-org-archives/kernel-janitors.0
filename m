From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 15 Oct 2018 02:56:40 +0000
Subject: [PATCH -next] fore200e: fix missing unlock on error in bsq_audit()
Message-Id: <1539572836-187019-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, Christoph Hellwig <hch@lst.de>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Add the missing unlock before return from function bsq_audit()
in the error handling case.

Fixes: 1d9d8be91788 ("fore200e: check for dma mapping failures")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/atm/fore200e.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/atm/fore200e.c b/drivers/atm/fore200e.c
index 2b5dc8f..ffc07ab 100644
--- a/drivers/atm/fore200e.c
+++ b/drivers/atm/fore200e.c
@@ -1606,6 +1606,7 @@ int bsq_audit(int where, struct host_bsq* bsq, int scheme, int magn)
     if (dma_mapping_error(fore200e->dev, tpd->tsd[0].buffer)) {
 	if (tx_copy)
 	    kfree(data);
+	spin_unlock_irqrestore(&fore200e->q_lock, flags);
 	return -ENOMEM;
     }
     tpd->tsd[ 0 ].length = tx_len;
