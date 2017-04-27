From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 27 Apr 2017 09:14:20 +0000
Subject: [PATCH] IB/rdmavt: restore IRQs on error path in rvt_create_ah()
Message-Id: <20170427091420.j7kl5tmzqnyami4s@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dennis Dalessandro <dennis.dalessandro-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Kamal Heib <kamalh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We need to call spin_unlock_irqrestore() instead of vanilla
spin_unlock() on this error path.

Fixes: 119a8e708d16 ("IB/rdmavt: Add AH to rdmavt")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/sw/rdmavt/ah.c b/drivers/infiniband/sw/rdmavt/ah.c
index 16c446142c2a..b0f09fb45c72 100644
--- a/drivers/infiniband/sw/rdmavt/ah.c
+++ b/drivers/infiniband/sw/rdmavt/ah.c
@@ -119,7 +119,7 @@ struct ib_ah *rvt_create_ah(struct ib_pd *pd,
 
 	spin_lock_irqsave(&dev->n_ahs_lock, flags);
 	if (dev->n_ahs_allocated = dev->dparms.props.max_ah) {
-		spin_unlock(&dev->n_ahs_lock);
+		spin_unlock_irqrestore(&dev->n_ahs_lock, flags);
 		kfree(ah);
 		return ERR_PTR(-ENOMEM);
 	}
