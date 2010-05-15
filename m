From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:23:48 +0000
Subject: [PATCH 35/37] drivers/block/aoe: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152323310.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ed L. Cashin" <ecashin@coraid.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/block/aoe/aoechr.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/drivers/block/aoe/aoechr.c b/drivers/block/aoe/aoechr.c
--- a/drivers/block/aoe/aoechr.c
+++ b/drivers/block/aoe/aoechr.c
@@ -132,13 +132,12 @@ bail:		spin_unlock_irqrestore(&emsgs_loc
 		return;
 	}
 
-	mp = kmalloc(n, GFP_ATOMIC);
+	mp = kmemdup(msg, n, GFP_ATOMIC);
 	if (mp = NULL) {
 		printk(KERN_ERR "aoe: allocation failure, len=%ld\n", n);
 		goto bail;
 	}
 
-	memcpy(mp, msg, n);
 	em->msg = mp;
 	em->flags |= EMFL_VALID;
 	em->len = n;
