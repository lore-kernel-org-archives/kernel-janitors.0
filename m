From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Nov 2015 08:39:52 +0000
Subject: [patch 2/2] xprtrdma: checking for NULL instead of IS_ERR()
Message-Id: <20151105083952.GB19405@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@primarydata.com>, Chuck Lever <chuck.lever@oracle.com>
Cc: Jeff Layton <jlayton@poochiereds.net>, Anna Schumaker <anna.schumaker@netapp.com>, Sagi Grimberg <sagig@mellanox.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The rpcrdma_create_req() function returns error pointers or success.  It
never returns NULL.

Fixes: f531a5dbc451 ('xprtrdma: Pre-allocate backward rpc_rqst and send/receive buffers')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/sunrpc/xprtrdma/backchannel.c b/net/sunrpc/xprtrdma/backchannel.c
index 2dcb44f..97554ca 100644
--- a/net/sunrpc/xprtrdma/backchannel.c
+++ b/net/sunrpc/xprtrdma/backchannel.c
@@ -42,8 +42,8 @@ static int rpcrdma_bc_setup_rqst(struct rpcrdma_xprt *r_xprt,
 	size_t size;
 
 	req = rpcrdma_create_req(r_xprt);
-	if (!req)
-		return -ENOMEM;
+	if (IS_ERR(req))
+		return PTR_ERR(req);
 	req->rl_backchannel = true;
 
 	size = RPCRDMA_INLINE_WRITE_THRESHOLD(rqst);
