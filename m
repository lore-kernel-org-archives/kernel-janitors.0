From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Jul 2013 16:48:32 +0000
Subject: [patch] RDMA/cxgb4: stack info leak in c4iw_create_qp()
Message-Id: <20130725164832.GA7026@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wise <swise@chelsio.com>
Cc: Roland Dreier <roland@kernel.org>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

"uresp.ma_sync_key" doesn't get set on this path so we leak 8 bytes of
data.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/cxgb4/qp.c b/drivers/infiniband/hw/cxgb4/qp.c
index 2320404..a4975e1 100644
--- a/drivers/infiniband/hw/cxgb4/qp.c
+++ b/drivers/infiniband/hw/cxgb4/qp.c
@@ -1657,6 +1657,8 @@ struct ib_qp *c4iw_create_qp(struct ib_pd *pd, struct ib_qp_init_attr *attrs,
 		if (mm5) {
 			uresp.ma_sync_key = ucontext->key;
 			ucontext->key += PAGE_SIZE;
+		} else {
+			uresp.ma_sync_key =  0;
 		}
 		uresp.sq_key = ucontext->key;
 		ucontext->key += PAGE_SIZE;
