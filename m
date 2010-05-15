From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:23:31 +0000
Subject: [PATCH 34/37] drivers/mtd: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152323150.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/mtd/mtdconcat.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -183,10 +183,9 @@ concat_writev(struct mtd_info *mtd, cons
 	}
 
 	/* make a copy of vecs */
-	vecs_copy = kmalloc(sizeof(struct kvec) * count, GFP_KERNEL);
+	vecs_copy = kmemdup(vecs, sizeof(struct kvec) * count, GFP_KERNEL);
 	if (!vecs_copy)
 		return -ENOMEM;
-	memcpy(vecs_copy, vecs, sizeof(struct kvec) * count);
 
 	entry_low = 0;
 	for (i = 0; i < concat->num_subdev; i++) {
