From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Jan 2016 11:49:36 +0000
Subject: [patch] staging: rdma: shift wrapping bug in c2_get_dma_mr()
Message-Id: <20160108114936.GA3802@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Christoph Hellwig <hch@lst.de>
Cc: devel@driverdev.osuosl.org, linux-rdma@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steve Wise <swise@opengridcomputing.com>, kernel-janitors@vger.kernel.org, Matan Barak <matanb@mellanox.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Geliang Tang <geliangtang@163.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>

We should be using all 64 bits of page_list[i] instead of just the lower
32.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rdma/amso1100/c2_provider.c b/drivers/staging/rdma/amso1100/c2_provider.c
index de8d10e..ac6a6ff 100644
--- a/drivers/staging/rdma/amso1100/c2_provider.c
+++ b/drivers/staging/rdma/amso1100/c2_provider.c
@@ -361,7 +361,7 @@ static struct ib_mr *c2_get_dma_mr(struct ib_pd *pd, int acc)
 	}
 
 	for (i = 0; i < pbl_depth; i++)
-		page_list[i] = (i << page_shift);
+		page_list[i] = ((u64)i << page_shift);
 
 	mr = kmalloc(sizeof(*mr), GFP_KERNEL);
 	if (!mr) {
