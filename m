From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Jun 2019 21:46:08 +0000
Subject: [PATCH][next] RDMA/hns: fix potential integer overflow on left shift
Message-Id: <20190624214608.11765-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a potential integer overflow when int i is left shifted
as this is evaluated using 32 bit arithmetic but is being used in
a context that expects an expression of type dma_addr_t.  Fix this
by casting integer i to dma_addr_t before shifting to avoid the
overflow.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 2ac0bc5e725e ("RDMA/hns: Add a group interfaces for optimizing buffers getting flow")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/hns/hns_roce_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_alloc.c b/drivers/infiniband/hw/hns/hns_roce_alloc.c
index 14fcc359599c..2c8defa94107 100644
--- a/drivers/infiniband/hw/hns/hns_roce_alloc.c
+++ b/drivers/infiniband/hw/hns/hns_roce_alloc.c
@@ -257,7 +257,7 @@ int hns_roce_get_kmem_bufs(struct hns_roce_dev *hr_dev, dma_addr_t *bufs,
 	for (i = start; i < end; i++)
 		if (buf->nbufs = 1)
 			bufs[total++] = buf->direct.map +
-					(i << buf->page_shift);
+					((dma_addr_t)i << buf->page_shift);
 		else
 			bufs[total++] = buf->page_list[i].map;
 
-- 
2.20.1
