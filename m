From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 May 2020 12:02:56 +0000
Subject: [PATCH] RDMA/rtrs: Fix some signedness bugs in error handling
Message-Id: <20200519120256.GC42765@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Danil Kipnis <danil.kipnis@cloud.ionos.com>, Jack Wang <jinpu.wang@cloud.ionos.com>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem is that "req->sg_cnt" is an unsigned int so if "nr" is
negative, it gets type promoted to a high positive value and the
condition is false.  This patch fixes it by handling negatives separately.

Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/ulp/rtrs/rtrs-clt.c | 7 +++----
 drivers/infiniband/ulp/rtrs/rtrs-srv.c | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
index 468fdd0d8713..17f99f0962d0 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
@@ -1047,11 +1047,10 @@ static int rtrs_map_sg_fr(struct rtrs_clt_io_req *req, size_t count)
 
 	/* Align the MR to a 4K page size to match the block virt boundary */
 	nr = ib_map_mr_sg(req->mr, req->sglist, count, NULL, SZ_4K);
-	if (unlikely(nr < req->sg_cnt)) {
-		if (nr < 0)
-			return nr;
+	if (nr < 0)
+		return -EINVAL;
+	if (unlikely(nr < req->sg_cnt))
 		return -EINVAL;
-	}
 	ib_update_fast_reg_key(req->mr, ib_inc_rkey(req->mr->rkey));
 
 	return nr;
diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv.c b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
index ba8ab33b94a2..eefd149ce7a4 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-srv.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
@@ -649,7 +649,7 @@ static int map_cont_bufs(struct rtrs_srv_sess *sess)
 		}
 		nr = ib_map_mr_sg(mr, sgt->sgl, sgt->nents,
 				  NULL, max_chunk_size);
-		if (nr < sgt->nents) {
+		if (nr < 0 || nr < sgt->nents) {
 			err = nr < 0 ? nr : -EINVAL;
 			goto dereg_mr;
 		}
-- 
2.26.2
