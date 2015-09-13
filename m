From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:07 +0000
Subject: [PATCH 14/39] SUNRPC: drop null test before destroy functions
Message-Id: <1442146532-9100-15-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, Jeff Layton <jlayton@poochiereds.net>, Trond Myklebust <trond.myklebust@primarydata.com>, Anna Schumaker <anna.schumaker@netapp.com>, "David S. Miller" <davem@davemloft.net>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Remove unneeded NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression x; @@
-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 net/sunrpc/sched.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/net/sunrpc/sched.c b/net/sunrpc/sched.c
index b140c09..425ca2f 100644
--- a/net/sunrpc/sched.c
+++ b/net/sunrpc/sched.c
@@ -1092,14 +1092,10 @@ void
 rpc_destroy_mempool(void)
 {
 	rpciod_stop();
-	if (rpc_buffer_mempool)
-		mempool_destroy(rpc_buffer_mempool);
-	if (rpc_task_mempool)
-		mempool_destroy(rpc_task_mempool);
-	if (rpc_task_slabp)
-		kmem_cache_destroy(rpc_task_slabp);
-	if (rpc_buffer_slabp)
-		kmem_cache_destroy(rpc_buffer_slabp);
+	mempool_destroy(rpc_buffer_mempool);
+	mempool_destroy(rpc_task_mempool);
+	kmem_cache_destroy(rpc_task_slabp);
+	kmem_cache_destroy(rpc_buffer_slabp);
 	rpc_destroy_wait_queue(&delay_queue);
 }
 

