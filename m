From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 05 Jan 2019 13:06:48 +0000
Subject: [PATCH 2/2] xprtrdma: Double free in rpcrdma_sendctxs_create()
Message-Id: <20190105130648.GC3288@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>, Chuck Lever <chuck.lever@oracle.com>
Cc: Jeff Layton <jlayton@kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The clean up is handled by the caller, rpcrdma_buffer_create(), so this
call to rpcrdma_sendctxs_destroy() leads to a double free.

Fixes: ae72950abf99 ("xprtrdma: Add data structure to manage RDMA Send arguments")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/sunrpc/xprtrdma/verbs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/net/sunrpc/xprtrdma/verbs.c b/net/sunrpc/xprtrdma/verbs.c
index 3dde05892c8e..4994e75945b8 100644
--- a/net/sunrpc/xprtrdma/verbs.c
+++ b/net/sunrpc/xprtrdma/verbs.c
@@ -845,17 +845,13 @@ static int rpcrdma_sendctxs_create(struct rpcrdma_xprt *r_xprt)
 	for (i = 0; i <= buf->rb_sc_last; i++) {
 		sc = rpcrdma_sendctx_create(&r_xprt->rx_ia);
 		if (!sc)
-			goto out_destroy;
+			return -ENOMEM;
 
 		sc->sc_xprt = r_xprt;
 		buf->rb_sc_ctxs[i] = sc;
 	}
 
 	return 0;
-
-out_destroy:
-	rpcrdma_sendctxs_destroy(buf);
-	return -ENOMEM;
 }
 
 /* The sendctx queue is not guaranteed to have a size that is a
-- 
2.17.1
