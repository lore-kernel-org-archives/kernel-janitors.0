From: Julia Lawall <julia@diku.dk>
Date: Sat, 22 May 2010 08:19:52 +0000
Subject: [PATCH 5/27] mm: Use memdup_user
Message-Id: <Pine.LNX.4.64.1005221019370.13021@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use memdup_user when user data is immediately copied into the
allocated region.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to,size,flag;
position p;
identifier l1,l2;
@@

-  to = \(kmalloc@p\|kzalloc@p\)(size,flag);
+  to = memdup_user(from,size);
   if (
-      to=NULL
+      IS_ERR(to)
                 || ...) {
   <+... when != goto l1;
-  -ENOMEM
+  PTR_ERR(to)
   ...+>
   }
-  if (copy_from_user(to, from, size) != 0) {
-    <+... when != goto l2;
-    -EFAULT
-    ...+>
-  }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 mm/util.c |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/mm/util.c b/mm/util.c
index f5712e8..4735ea4 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -225,15 +225,10 @@ char *strndup_user(const char __user *s, long n)
 	if (length > n)
 		return ERR_PTR(-EINVAL);
 
-	p = kmalloc(length, GFP_KERNEL);
+	p = memdup_user(s, length);
 
-	if (!p)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(p, s, length)) {
-		kfree(p);
-		return ERR_PTR(-EFAULT);
-	}
+	if (IS_ERR(p))
+		return p;
 
 	p[length - 1] = '\0';
 
