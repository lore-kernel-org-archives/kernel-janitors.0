From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 01 Feb 2012 07:46:20 +0000
Subject: [patch] SUNRPC: remove an unneeded NULL check in xprt_connect()
Message-Id: <20120201074620.GD22179@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>, "David S. Miller" <davem@davemloft.net>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We check "task->tk_rqstp" and then we dereference it without checking on
the next line.  The only caller is call_connect() and that has a check
which prevents it from calling xprt_connect() with a NULL.

                if (task->tk_status < 0)
                        return;

If "task->tk_rqstp" were NULL then "tk_status" would be -EAGAIN.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/sunrpc/xprt.c b/net/sunrpc/xprt.c
index 839f6ef..efe5495 100644
--- a/net/sunrpc/xprt.c
+++ b/net/sunrpc/xprt.c
@@ -715,9 +715,7 @@ void xprt_connect(struct rpc_task *task)
 	if (xprt_connected(xprt))
 		xprt_release_write(xprt, task);
 	else {
-		if (task->tk_rqstp)
-			task->tk_rqstp->rq_bytes_sent = 0;
-
+		task->tk_rqstp->rq_bytes_sent = 0;
 		task->tk_timeout = task->tk_rqstp->rq_timeout;
 		rpc_sleep_on(&xprt->pending, task, xprt_connect_status);
 
