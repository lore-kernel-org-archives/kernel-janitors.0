From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Feb 2017 21:11:40 +0000
Subject: [PATCH 01/14] RDMA/cxgb3: Use kcalloc() in cxio_create_qp()
Message-Id: <e432045a-5b36-9444-3b4a-adeffa6287db@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0aff92fa-2891-333a-2e1e-ca309db2ec72@users.sourceforge.net>
In-Reply-To: <0aff92fa-2891-333a-2e1e-ca309db2ec72@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Sean Hefty <sean.hefty@intel.com>, Steve Wise <swise@chelsio.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Feb 2017 11:37:13 +0100

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data structures by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/cxgb3/cxio_hal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/cxgb3/cxio_hal.c b/drivers/infiniband/hw/cxgb3/cxio_hal.c
index ada2e5009c86..aeb1dfa8bfe5 100644
--- a/drivers/infiniband/hw/cxgb3/cxio_hal.c
+++ b/drivers/infiniband/hw/cxgb3/cxio_hal.c
@@ -281,7 +281,7 @@ int cxio_create_qp(struct cxio_rdev *rdev_p, u32 kernel_domain,
 	if (!wq->qpid)
 		return -ENOMEM;
 
-	wq->rq = kzalloc(depth * sizeof(struct t3_swrq), GFP_KERNEL);
+	wq->rq = kcalloc(depth, sizeof(*wq->rq), GFP_KERNEL);
 	if (!wq->rq)
 		goto err1;
 
@@ -289,7 +289,7 @@ int cxio_create_qp(struct cxio_rdev *rdev_p, u32 kernel_domain,
 	if (!wq->rq_addr)
 		goto err2;
 
-	wq->sq = kzalloc(depth * sizeof(struct t3_swsq), GFP_KERNEL);
+	wq->sq = kcalloc(depth, sizeof(*wq->sq), GFP_KERNEL);
 	if (!wq->sq)
 		goto err3;
 
-- 
2.11.1

