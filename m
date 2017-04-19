From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Apr 2017 09:54:33 +0000
Subject: [PATCH net-next] qede: allocate enough data for ->arfs_fltr_bmap
Message-Id: <20170419095432.GA4266@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuval Mintz <Yuval.Mintz@cavium.com>, Chopra@mwanda, Manish <Manish.Chopra@cavium.com>
Cc: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We've got the number of longs, yes, but we should multiply by
sizeof(long) to get the number of bytes needed.

Fixes: e4917d46a653 ("qede: Add aRFS support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Btw, this driver use vmalloc() all over the place but kmalloc() is more
appropriate when you're allocating tiny ammounts.

diff --git a/drivers/net/ethernet/qlogic/qede/qede_filter.c b/drivers/net/ethernet/qlogic/qede/qede_filter.c
index 8c594a3ca63b..34473fbac798 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_filter.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_filter.c
@@ -267,7 +267,8 @@ int qede_alloc_arfs(struct qede_dev *edev)
 		return -ENOMEM;
 	}
 
-	edev->arfs->arfs_fltr_bmap = vzalloc(BITS_TO_LONGS(QEDE_RFS_MAX_FLTR));
+	edev->arfs->arfs_fltr_bmap = vzalloc(BITS_TO_LONGS(QEDE_RFS_MAX_FLTR) *
+					     sizeof(long));
 	if (!edev->arfs->arfs_fltr_bmap) {
 		free_irq_cpu_rmap(edev->ndev->rx_cpu_rmap);
 		edev->ndev->rx_cpu_rmap = NULL;
