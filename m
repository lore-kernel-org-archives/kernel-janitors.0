From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Feb 2014 11:09:37 +0000
Subject: [patch] IB/qib: remove duplicative check in get_a_ctxt()
Message-Id: <20140213110937.GA15549@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We already know "pusable" is non-zero, no need to check again.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/qib/qib_file_ops.c b/drivers/infiniband/hw/qib/qib_file_ops.c
index 275f247f9fca..cff8f830492c 100644
--- a/drivers/infiniband/hw/qib/qib_file_ops.c
+++ b/drivers/infiniband/hw/qib/qib_file_ops.c
@@ -1459,7 +1459,7 @@ static int get_a_ctxt(struct file *fp, const struct qib_user_info *uinfo,
 					cused++;
 				else
 					cfree++;
-			if (pusable && cfree && cused < inuse) {
+			if (cfree && cused < inuse) {
 				udd = dd;
 				inuse = cused;
 			}
