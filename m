From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Feb 2013 11:22:36 +0000
Subject: [patch] IB/mlx4: fix bug unwinding on error in mlx4_ib_init_sriov()
Message-Id: <20130204112236.GA8878@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jack Morgenstein <jackm-LDSdmyG8hGV8YrgS2mwiifqBs+8SCbDb@public.gmane.org>, Or Gerlitz <ogerlitz-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Amir Vadai <amirv-VPRAkNaXOzVS1MOuV/RT9w@public.gmane.org>, Oren Duer <oren-VPRAkNaXOzVS1MOuV/RT9w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We have to decrement "i" before calling mlx4_ib_free_demux_ctx() or we
free something that wasn't allocated.  That's fine for free_pv_object()
but it would lead to a NULL dereference calling
mlx4_ib_free_demux_ctx().  The null dereference is because ->tun is NULL
when we check:

	if (!ctx->tun[i])

Also we didn't free ->sriov.demux[0] so it was a small leak.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  I have not tested this.

diff --git a/drivers/infiniband/hw/mlx4/mad.c b/drivers/infiniband/hw/mlx4/mad.c
index 0a903c1..934792c 100644
--- a/drivers/infiniband/hw/mlx4/mad.c
+++ b/drivers/infiniband/hw/mlx4/mad.c
@@ -1999,16 +1999,17 @@ int mlx4_ib_init_sriov(struct mlx4_ib_dev *dev)
 			goto demux_err;
 		err = mlx4_ib_alloc_demux_ctx(dev, &dev->sriov.demux[i], i + 1);
 		if (err)
-			goto demux_err;
+			goto free_pv;
 	}
 	mlx4_ib_master_tunnels(dev, 1);
 	return 0;
 
+free_pv:
+	free_pv_object(dev, mlx4_master_func_num(dev->dev), i + 1);
 demux_err:
-	while (i > 0) {
+	while (--i >= 0) {
 		free_pv_object(dev, mlx4_master_func_num(dev->dev), i + 1);
 		mlx4_ib_free_demux_ctx(&dev->sriov.demux[i]);
-		--i;
 	}
 	mlx4_ib_device_unregister_sysfs(dev);
 
