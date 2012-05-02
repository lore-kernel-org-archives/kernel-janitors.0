From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 May 2012 06:13:57 +0000
Subject: [patch 1/2] RDMA/ocrdma: checking for NULL instead of IS_ERR
Message-Id: <20120502061357.GA28894@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Parav Pandit <parav.pandit-laKkSmNT4hbQT0dZR+AlfA@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The ocrdma_alloc_lkey() function never returns NULL pointers, it
returns ERR_PTRs.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
index eb55c80..0d1872f 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
@@ -486,8 +486,8 @@ struct ib_mr *ocrdma_get_dma_mr(struct ib_pd *ibpd, int acc)
 	struct ocrdma_mr *mr;
 
 	mr = ocrdma_alloc_lkey(ibpd, acc, 0, OCRDMA_ADDR_CHECK_DISABLE);
-	if (!mr)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(mr))
+		return ERR_CAST(mr);
 
 	return &mr->ibmr;
 }
