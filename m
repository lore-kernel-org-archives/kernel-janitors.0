From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 02 Aug 2019 01:31:49 +0000
Subject: [PATCH -next] staging: fsl-dpaa2/ethsw: Remove useless set memory to zero use memset()
Message-Id: <20190802013149.80952-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The memory return by kzalloc() has already be set to zero, so remove
useless memset(0).

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/staging/fsl-dpaa2/ethsw/ethsw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/fsl-dpaa2/ethsw/ethsw.c b/drivers/staging/fsl-dpaa2/ethsw/ethsw.c
index 4b94a01513a7..aac98ece2335 100644
--- a/drivers/staging/fsl-dpaa2/ethsw/ethsw.c
+++ b/drivers/staging/fsl-dpaa2/ethsw/ethsw.c
@@ -641,8 +641,6 @@ static int port_fdb_dump(struct sk_buff *skb, struct netlink_callback *cb,
 	if (!dma_mem)
 		return -ENOMEM;
 
-	memset(dma_mem, 0, fdb_dump_size);
-
 	fdb_dump_iova = dma_map_single(dev, dma_mem, fdb_dump_size,
 				       DMA_FROM_DEVICE);
 	if (dma_mapping_error(dev, fdb_dump_iova)) {
