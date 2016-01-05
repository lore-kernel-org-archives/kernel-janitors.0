From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jan 2016 09:52:49 +0000
Subject: [patch -next] svcrdma: fix a couple warning messages
Message-Id: <20160105095249.GB23619@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>, Chuck Lever <chuck.lever@oracle.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>, Jeff Layton <jlayton@poochiereds.net>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Doug Ledford <dledford@redhat.com>, Steve Wise <swise@opengridcomputing.com>, Sagi Grimberg <sagig@mellanox.com>, Michael Wang <yun.wang@profitbricks.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The WARN_ON_ONCE() macro takes a condition, passing it this string
literal sort of works as intended but it's better to use WARN_ONCE()
instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/sunrpc/xprtrdma/svc_rdma_transport.c b/net/sunrpc/xprtrdma/svc_rdma_transport.c
index abfbd02..4b397ad 100644
--- a/net/sunrpc/xprtrdma/svc_rdma_transport.c
+++ b/net/sunrpc/xprtrdma/svc_rdma_transport.c
@@ -221,7 +221,7 @@ out_empty:
 	spin_lock_bh(&xprt->sc_ctxt_lock);
 	xprt->sc_ctxt_used--;
 	spin_unlock_bh(&xprt->sc_ctxt_lock);
-	WARN_ON_ONCE("svcrdma: empty RDMA ctxt list?\n");
+	WARN_ONCE(1, "svcrdma: empty RDMA ctxt list?\n");
 	return NULL;
 }
 
@@ -328,7 +328,7 @@ out_empty:
 	if (map)
 		goto out;
 
-	WARN_ON_ONCE("svcrdma: empty request map list?\n");
+	WARN_ONCE(1, "svcrdma: empty request map list?\n");
 	return NULL;
 }
 
