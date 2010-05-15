From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:14:12 +0000
Subject: [PATCH 4/37] drivers/block: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152313540.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy@xensource.com>, Chris Wright <chrisw@sous-sol.org>, virtualization@lists.osdl.org, xen-devel@lists.xensource.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kmemdup when some other buffer is immediately copied into the
allocated region.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to,size,flag;
statement S;
@@

-  to = \(kmalloc\|kzalloc\)(size,flag);
+  to = kmemdup(from,size,flag);
   if (to=NULL || ...) S
-  memcpy(to, from, size);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/block/xen-blkfront.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -775,11 +775,10 @@ static int blkif_recover(struct blkfront
 	int j;
 
 	/* Stage 1: Make a safe copy of the shadow state. */
-	copy = kmalloc(sizeof(info->shadow),
+	copy = kmemdup(info->shadow, sizeof(info->shadow),
 		       GFP_NOIO | __GFP_REPEAT | __GFP_HIGH);
 	if (!copy)
 		return -ENOMEM;
-	memcpy(copy, info->shadow, sizeof(info->shadow));
 
 	/* Stage 2: Set up free list. */
 	memset(&info->shadow, 0, sizeof(info->shadow));
