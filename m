From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Aug 2018 19:24:31 +0000
Subject: [PATCH] RDMA: Fix an uninitialized variable
Message-Id: <20180803192431.pmisuz3qwefd45se@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

A couple of the callers assume that ib_post_send() initializes
*bad_send_wr.  It doesn't look like we can rely on the ->post_send()
function to initialize it.  For example in the i40iw_post_recv()
function and there are some error paths there which don't set it.

Here are the static checker warnings for reference:

net/sunrpc/xprtrdma/verbs.c:1564 rpcrdma_post_recvs() error: uninitialized symbol 'bad_wr'.
net/sunrpc/xprtrdma/svc_rdma_rw.c:350 svc_rdma_post_chunk_ctxt() error: uninitialized symbol 'bad_wr'.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/include/rdma/ib_verbs.h b/include/rdma/ib_verbs.h
index 8caee90e6dee..0ebacbe5019e 100644
--- a/include/rdma/ib_verbs.h
+++ b/include/rdma/ib_verbs.h
@@ -3389,6 +3389,8 @@ static inline int ib_post_send(struct ib_qp *qp,
 {
 	const struct ib_send_wr *dummy;
 
+	if (bad_send_wr)
+		*bad_send_wr = NULL;
 	return qp->device->post_send(qp, send_wr, bad_send_wr ? : &dummy);
 }
 
