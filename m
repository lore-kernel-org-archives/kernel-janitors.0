From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Jul 2020 16:26:04 +0000
Subject: [PATCH] xprtrdma: fix incorrect header size calcations
Message-Id: <20200715162604.1080552-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, "J . Bruce Fields" <bfields@fieldses.org>, Chuck Lever <chuck.lever@oracle.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the header size calculations are using an assignment
operator instead of a += operator when accumulating the header
size leading to incorrect sizes.  Fix this by using the correct
operator.

Addresses-Coverity: ("Unused value")
Fixes: 302d3deb2068 ("xprtrdma: Prevent inline overflow")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/sunrpc/xprtrdma/rpc_rdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/sunrpc/xprtrdma/rpc_rdma.c b/net/sunrpc/xprtrdma/rpc_rdma.c
index 935bbef2f7be..453bacc99907 100644
--- a/net/sunrpc/xprtrdma/rpc_rdma.c
+++ b/net/sunrpc/xprtrdma/rpc_rdma.c
@@ -71,7 +71,7 @@ static unsigned int rpcrdma_max_call_header_size(unsigned int maxsegs)
 	size = RPCRDMA_HDRLEN_MIN;
 
 	/* Maximum Read list size */
-	size = maxsegs * rpcrdma_readchunk_maxsz * sizeof(__be32);
+	size += maxsegs * rpcrdma_readchunk_maxsz * sizeof(__be32);
 
 	/* Minimal Read chunk size */
 	size += sizeof(__be32);	/* segment count */
@@ -94,7 +94,7 @@ static unsigned int rpcrdma_max_reply_header_size(unsigned int maxsegs)
 	size = RPCRDMA_HDRLEN_MIN;
 
 	/* Maximum Write list size */
-	size = sizeof(__be32);		/* segment count */
+	size += sizeof(__be32);		/* segment count */
 	size += maxsegs * rpcrdma_segment_maxsz * sizeof(__be32);
 	size += sizeof(__be32);	/* list discriminator */
 
-- 
2.27.0
