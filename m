From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Apr 2014 15:08:58 +0000
Subject: [patch] RDMA/cxgb4: release mutex on error in c4iw_reject_cr()
Message-Id: <20140402150858.GA552@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <001f01cf4e7f$6ceba770$46c2f650$@opengridcomputing.com>
In-Reply-To: <001f01cf4e7f$6ceba770$46c2f650$@opengridcomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We recently added some locking to this function and there was an error
path which missed the unlock.

Fixes: 9306dcbc96f3 ('RDMA/cxgb4: Lock around accept/reject downcalls')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxgb4/cm.c
index 303e29c..f3753a1 100644
--- a/drivers/infiniband/hw/cxgb4/cm.c
+++ b/drivers/infiniband/hw/cxgb4/cm.c
@@ -2524,6 +2524,7 @@ int c4iw_reject_cr(struct iw_cm_id *cm_id, const void *pdata, u8 pdata_len)
 
 	mutex_lock(&ep->com.mutex);
 	if (ep->com.state = DEAD) {
+		mutex_unlock(&ep->com.mutex);
 		c4iw_put_ep(&ep->com);
 		return -ECONNRESET;
 	}
