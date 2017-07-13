From: Colin King <colin.king@canonical.com>
Date: Thu, 13 Jul 2017 17:51:15 +0000
Subject: [PATCH][net-next] svcrdma: fix an incorrect check on -E2BIG and -EINVAL
Message-Id: <20170713175115.9044-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@primarydata.com>, Anna Schumaker <anna.schumaker@netapp.com>, "J . Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@poochiereds.net>, "David S . Miller" <davem@davemloft.net>, Chuck Lever <chuck.lever@oracle.com>, Sagi Grimberg <sagi@grimberg.me>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The current check will always be true and will always jump to
err1, this looks dubious to me. I believe && should be used
instead of ||.

Detected by CoverityScan, CID#1450120 ("Logically Dead Code")

Fixes: 107c1d0a991a ("svcrdma: Avoid Send Queue overflow")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/sunrpc/xprtrdma/svc_rdma_sendto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sunrpc/xprtrdma/svc_rdma_sendto.c b/net/sunrpc/xprtrdma/svc_rdma_sendto.c
index 19fd01e4b690..7c3a211e0e9a 100644
--- a/net/sunrpc/xprtrdma/svc_rdma_sendto.c
+++ b/net/sunrpc/xprtrdma/svc_rdma_sendto.c
@@ -684,7 +684,7 @@ int svc_rdma_sendto(struct svc_rqst *rqstp)
 	return 0;
 
  err2:
-	if (ret != -E2BIG || ret != -EINVAL)
+	if (ret != -E2BIG && ret != -EINVAL)
 		goto err1;
 
 	ret = svc_rdma_post_recv(rdma, GFP_KERNEL);
-- 
2.11.0

