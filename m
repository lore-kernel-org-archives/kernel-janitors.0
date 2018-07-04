From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 09:32:12 +0000
Subject: [PATCH] IB/core: type promotion bug in rdma_rw_init_one_mr()
Message-Id: <20180704093211.o62tr44m3ugxxhjh@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"nents" is an unsigned int, so if ib_map_mr_sg() returns a negative
error code then it's type promoted to a high unsigned int which is
treated as success.

Fixes: a060b5629ab0 ("IB/core: generic RDMA READ/WRITE API")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/core/rw.c b/drivers/infiniband/core/rw.c
index c8963e91f92a..3ee0adfb45e9 100644
--- a/drivers/infiniband/core/rw.c
+++ b/drivers/infiniband/core/rw.c
@@ -87,7 +87,7 @@ static int rdma_rw_init_one_mr(struct ib_qp *qp, u8 port_num,
 	}
 
 	ret = ib_map_mr_sg(reg->mr, sg, nents, &offset, PAGE_SIZE);
-	if (ret < nents) {
+	if (ret < 0 || ret < nents) {
 		ib_mr_pool_put(qp, &qp->rdma_mrs, reg->mr);
 		return -EINVAL;
 	}
