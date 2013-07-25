From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Jul 2013 17:04:36 +0000
Subject: [patch] IB/mlx5: stack info leak in mlx5_ib_alloc_ucontext()
Message-Id: <20130725170436.GC7026@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eli Cohen <eli-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We don't set "resp.reserved".  Since it's at the end of the struct that
means we don't have to copy it to the user.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/mlx5/main.c b/drivers/infiniband/hw/mlx5/main.c
index 8000fff..43dfb84 100644
--- a/drivers/infiniband/hw/mlx5/main.c
+++ b/drivers/infiniband/hw/mlx5/main.c
@@ -619,7 +619,8 @@ static struct ib_ucontext *mlx5_ib_alloc_ucontext(struct ib_device *ibdev,
 
 	resp.tot_uuars = req.total_num_uuars;
 	resp.num_ports = dev->mdev.caps.num_ports;
-	err = ib_copy_to_udata(udata, &resp, sizeof(resp));
+	err = ib_copy_to_udata(udata, &resp,
+			       sizeof(resp) - sizeof(resp.reserved));
 	if (err)
 		goto out_uars;
 
