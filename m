From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Jul 2017 07:46:49 +0000
Subject: [PATCH 2/2] RDMA/ocrdma: Fix error codes in ocrdma_create_srq()
Message-Id: <20170713074649.tmcxi3a3qpilyomq@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170713074614.obgl5mxxygcluyog@mwanda>
In-Reply-To: <20170713074614.obgl5mxxygcluyog@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Selvin Xavier <selvin.xavier-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Parav Pandit <parav.pandit-laKkSmNT4hbQT0dZR+AlfA@public.gmane.org>
Cc: Devesh Sharma <devesh.sharma-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leon Romanovsky <leon-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dasaratharaman Chandramouli <dasaratharaman.chandramouli-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Or Gerlitz <ogerlitz-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, ssh10 <mayhs11saini-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Artemy Kovalyov <artemyko-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

If either of these allocations fail then we return ERR_PTR(0).  That's
equivalent to NULL and results in a NULL pointer dereference in the
caller.

Fixes: fe2caefcdf58 ("RDMA/ocrdma: Add driver for Emulex OneConnect IBoE RDMA adapter")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
index cc317e858040..27d5e8d9f08d 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
@@ -1902,6 +1902,7 @@ struct ib_srq *ocrdma_create_srq(struct ib_pd *ibpd,
 		goto err;
 
 	if (udata = NULL) {
+		status = -ENOMEM;
 		srq->rqe_wr_id_tbl = kzalloc(sizeof(u64) * srq->rq.max_cnt,
 			    GFP_KERNEL);
 		if (srq->rqe_wr_id_tbl = NULL)
