From: Dan Carpenter <error27@gmail.com>
Date: Thu, 27 May 2010 09:11:28 +0000
Subject: [patch 3/3] rds/iw_rdma: remove unneeded kfree()
Message-Id: <20100527091128.GT22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Grover <andy.grover@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "dma_pages" variable is always NULL at this point so the kfree()
isn't needed.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/rds/iw_rdma.c b/net/rds/iw_rdma.c
index 48d5073..742ab6a 100644
--- a/net/rds/iw_rdma.c
+++ b/net/rds/iw_rdma.c
@@ -334,7 +334,6 @@ static u64 *rds_iw_map_scatterlist(struct rds_iw_device *rds_iwdev,
 out_unmap:
 	ib_dma_unmap_sg(rds_iwdev->dev, sg->list, sg->len, DMA_BIDIRECTIONAL);
 	sg->dma_len = 0;
-	kfree(dma_pages);
 	return ERR_PTR(ret);
 }
 
