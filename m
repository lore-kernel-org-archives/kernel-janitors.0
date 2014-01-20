From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Jan 2014 10:32:49 +0000
Subject: [patch] IB/usnic: use GFP_ATOMIC under spinlock
Message-Id: <20140120103248.GE14233@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131211223934.GB3955@elgon.mountain>
In-Reply-To: <20131211223934.GB3955-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Upinder Malhi <umalhi-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is called from qp_grp_and_vf_bind() and we are holding the
"vf->lock" so the allocation can't sleep.

Fixes: e3cf00d0a87f ('IB/usnic: Add Cisco VIC low-level hardware driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/usnic/usnic_uiom.c b/drivers/infiniband/hw/usnic/usnic_uiom.c
index ae6934c0d05a..16755cdab2c0 100644
--- a/drivers/infiniband/hw/usnic/usnic_uiom.c
+++ b/drivers/infiniband/hw/usnic/usnic_uiom.c
@@ -498,7 +498,7 @@ int usnic_uiom_attach_dev_to_pd(struct usnic_uiom_pd *pd, struct device *dev)
 	struct usnic_uiom_dev *uiom_dev;
 	int err;
 
-	uiom_dev = kzalloc(sizeof(*uiom_dev), GFP_KERNEL);
+	uiom_dev = kzalloc(sizeof(*uiom_dev), GFP_ATOMIC);
 	if (!uiom_dev)
 		return -ENOMEM;
 	uiom_dev->dev = dev;
