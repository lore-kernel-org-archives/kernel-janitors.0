From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 05 Jan 2019 13:06:07 +0000
Subject: [PATCH 1/2] xprtrdma: Fix error code in rpcrdma_buffer_create()
Message-Id: <20190105130607.GB3288@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Chuck Lever <chuck.lever@oracle.com>
Cc: Jeff Layton <jlayton@kernel.org>, Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

This should return -ENOMEM if __alloc_workqueue_key() fails, but it
returns success.

Fixes: 6d2d0ee27c7a ("xprtrdma: Replace rpcrdma_receive_wq with a per-xprt workqueue")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/sunrpc/xprtrdma/verbs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/sunrpc/xprtrdma/verbs.c b/net/sunrpc/xprtrdma/verbs.c
index 7749a2bf6887..3dde05892c8e 100644
--- a/net/sunrpc/xprtrdma/verbs.c
+++ b/net/sunrpc/xprtrdma/verbs.c
@@ -1113,8 +1113,10 @@ rpcrdma_buffer_create(struct rpcrdma_xprt *r_xprt)
 						WQ_MEM_RECLAIM | WQ_HIGHPRI,
 						0,
 			r_xprt->rx_xprt.address_strings[RPC_DISPLAY_ADDR]);
-	if (!buf->rb_completion_wq)
+	if (!buf->rb_completion_wq) {
+		rc = -ENOMEM;
 		goto out;
+	}
 
 	return 0;
 out:
-- 
2.17.1
