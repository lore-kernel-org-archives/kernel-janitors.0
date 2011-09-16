From: Julia Lawall <julia@diku.dk>
Date: Fri, 16 Sep 2011 06:57:32 +0000
Subject: [PATCH 1/4] drivers/block/xen-blkback/blkback.c: take size of pointed value, not pointer
Message-Id: <1316156255-19509-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Ian Campbell <ian.campbell@citrix.com>, Jan Beulich <jbeulich@novell.com>, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Sizeof a pointer-typed expression returns the size of the pointer, not that
of the pointed data.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression *e;
type T;
identifier f;
@@

f(...,(T)e,...,
-sizeof(e)
+sizeof(*e)
,...)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/block/xen-blkback/blkback.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -790,7 +790,7 @@ static int __init xen_blkif_init(void)
 	if (rc)
 		goto failed_init;
 
-	memset(blkbk->pending_reqs, 0, sizeof(blkbk->pending_reqs));
+	memset(blkbk->pending_reqs, 0, sizeof(*blkbk->pending_reqs));
 
 	INIT_LIST_HEAD(&blkbk->pending_free);
 	spin_lock_init(&blkbk->pending_free_lock);

