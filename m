From: Dan Carpenter <error27@gmail.com>
Date: Wed, 07 Apr 2010 09:39:01 +0000
Subject: [patch] infiniband: checking the wrong variable
Message-Id: <20100407093901.GG5157@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Lameter <cl-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jack Morgenstein <jackm-LDSdmyG8hGV8YrgS2mwiifqBs+8SCbDb@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The intent here was to check the "mfrpl->mapped_page_list" allocation.
We checked "mfrpl->ibfrpl.page_list" earlier.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/infiniband/hw/mlx4/mr.c b/drivers/infiniband/hw/mlx4/mr.c
index 56147b2..1d27b9a 100644
--- a/drivers/infiniband/hw/mlx4/mr.c
+++ b/drivers/infiniband/hw/mlx4/mr.c
@@ -240,7 +240,7 @@ struct ib_fast_reg_page_list *mlx4_ib_alloc_fast_reg_page_list(struct ib_device
 	mfrpl->mapped_page_list = dma_alloc_coherent(&dev->dev->pdev->dev,
 						     size, &mfrpl->map,
 						     GFP_KERNEL);
-	if (!mfrpl->ibfrpl.page_list)
+	if (!mfrpl->mapped_page_list)
 		goto err_free;
 
 	WARN_ON(mfrpl->map & 0x3f);
