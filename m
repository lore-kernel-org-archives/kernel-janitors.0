From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Nov 2015 08:37:08 +0000
Subject: [patch 1/2] xprtrdma: clean up some curly braces
Message-Id: <20151105083708.GA19405@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@primarydata.com>
Cc: Jeff Layton <jlayton@poochiereds.net>, Anna Schumaker <anna.schumaker@netapp.com>, Chuck Lever <chuck.lever@oracle.com>, Sagi Grimberg <sagig@mellanox.com>, Steve Wise <swise@opengridcomputing.com>, Doug Ledford <dledford@redhat.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

It doesn't matter either way, but the curly braces were clearly intended
here.  It causes a Smatch warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/sunrpc/xprtrdma/verbs.c b/net/sunrpc/xprtrdma/verbs.c
index eadd1655..2cc1014 100644
--- a/net/sunrpc/xprtrdma/verbs.c
+++ b/net/sunrpc/xprtrdma/verbs.c
@@ -852,10 +852,11 @@ retry:
 
 		if (extras) {
 			rc = rpcrdma_ep_post_extra_recv(r_xprt, extras);
-			if (rc)
+			if (rc) {
 				pr_warn("%s: rpcrdma_ep_post_extra_recv: %i\n",
 					__func__, rc);
 				rc = 0;
+			}
 		}
 	}
 
