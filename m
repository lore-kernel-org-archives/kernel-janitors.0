From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Mar 2010 11:04:45 +0000
Subject: [patch] sock.c: potential null dereference
Message-Id: <20100306110445.GC4958@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Eric Dumazet <eric.dumazet@gmail.com>, Jan Engelhardt <jengelh@medozas.de>, Ingo Molnar <mingo@elte.hu>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We test that "prot->rsk_prot" is non-null right before we dereference it
on this line.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/core/sock.c b/net/core/sock.c
index fcd397a..fa427b5 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2276,7 +2276,8 @@ out_free_request_sock_slab:
 		prot->rsk_prot->slab = NULL;
 	}
 out_free_request_sock_slab_name:
-	kfree(prot->rsk_prot->slab_name);
+	if (prot->rsk_prot)
+		kfree(prot->rsk_prot->slab_name);
 out_free_sock_slab:
 	kmem_cache_destroy(prot->slab);
 	prot->slab = NULL;
