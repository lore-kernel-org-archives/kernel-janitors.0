From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Oct 2014 08:44:16 +0000
Subject: [patch] SUNRPC: off by one in BUG_ON()
Message-Id: <20141029084416.GC8939@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Trond Myklebust <trond.myklebust@primarydata.com>, "David S. Miller" <davem@davemloft.net>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The m->pool_to[] array has "maxpools" number of elements.  It's
allocated in svc_pool_map_alloc_arrays() which we called earlier in the
function.  This test should be >= instead of >.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is very old code, but hopefully the off by one doesn't affect
runtime.

diff --git a/net/sunrpc/svc.c b/net/sunrpc/svc.c
index ca8a795..349c98f 100644
--- a/net/sunrpc/svc.c
+++ b/net/sunrpc/svc.c
@@ -189,7 +189,7 @@ svc_pool_map_init_percpu(struct svc_pool_map *m)
 		return err;
 
 	for_each_online_cpu(cpu) {
-		BUG_ON(pidx > maxpools);
+		BUG_ON(pidx >= maxpools);
 		m->to_pool[cpu] = pidx;
 		m->pool_to[pidx] = cpu;
 		pidx++;
