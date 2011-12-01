From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Dec 2011 11:37:59 +0000
Subject: [patch] RDMA/uverbs: potential integer overflow
Message-Id: <20111201113758.GA5206@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is a static checker fix, and I'm not super familiar with this code.

My checker complains that user_wr->num_sge + sg_ind can have an integer
overflow and wrap.  That's is true, but I don't know the code well
enough to say if it's a problem or not.

Can someone take a look at this?

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/core/uverbs_cmd.c b/drivers/infiniband/core/uverbs_cmd.c
index 254f164..e57b6d7 100644
--- a/drivers/infiniband/core/uverbs_cmd.c
+++ b/drivers/infiniband/core/uverbs_cmd.c
@@ -1939,7 +1939,8 @@ ssize_t ib_uverbs_post_send(struct ib_uverbs_file *file,
 			goto out_put;
 		}
 
-		if (user_wr->num_sge + sg_ind > cmd.sge_count) {
+		if (user_wr->num_sge > cmd.sge_count ||
+				user_wr->num_sge + sg_ind > cmd.sge_count) {
 			ret = -EINVAL;
 			goto out_put;
 		}
@@ -2085,7 +2086,8 @@ static struct ib_recv_wr *ib_uverbs_unmarshall_recv(const char __user *buf,
 			goto err;
 		}
 
-		if (user_wr->num_sge + sg_ind > sge_count) {
+		if (user_wr->num_sge > sge_count ||
+				user_wr->num_sge + sg_ind > sge_count) {
 			ret = -EINVAL;
 			goto err;
 		}
