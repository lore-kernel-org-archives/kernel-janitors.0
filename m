From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 15 Mar 2017 16:23:13 +0000
Subject: [PATCH 05/14] IB/ocrdma: Remove unneeded conversions to bool
Message-Id: <20170315162322.12096-5-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/infiniband/hw/ocrdma/ocrdma_verbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
index bc9fb144e57b..dc00924f8a3c 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
@@ -463,7 +463,7 @@ static struct ocrdma_pd *_ocrdma_alloc_pd(struct ocrdma_dev *dev,
 static inline int is_ucontext_pd(struct ocrdma_ucontext *uctx,
 				 struct ocrdma_pd *pd)
 {
-	return (uctx->cntxt_pd = pd ? true : false);
+	return (uctx->cntxt_pd = pd);
 }
 
 static int _ocrdma_dealloc_pd(struct ocrdma_dev *dev,
-- 
2.11.0

