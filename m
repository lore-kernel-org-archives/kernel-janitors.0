From: Julia Lawall <julia@diku.dk>
Date: Sat, 22 May 2010 08:22:00 +0000
Subject: [PATCH 12/27] drivers/ieee1394: Use memdup_user
Message-Id: <Pine.LNX.4.64.1005221021460.13021@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Richter <stefanr@s5r6.in-berlin.de>, linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/ieee1394/video1394.c |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/ieee1394/video1394.c b/drivers/ieee1394/video1394.c
index a42bd68..a77483b 100644
--- a/drivers/ieee1394/video1394.c
+++ b/drivers/ieee1394/video1394.c
@@ -1045,14 +1045,9 @@ static long video1394_ioctl(struct file *file,
 			if (get_user(qv, &p->packet_sizes))
 				return -EFAULT;
 
-			psizes = kmalloc(buf_size, GFP_KERNEL);
-			if (!psizes)
-				return -ENOMEM;
-
-			if (copy_from_user(psizes, qv, buf_size)) {
-				kfree(psizes);
-				return -EFAULT;
-			}
+			psizes = memdup_user(qv, buf_size);
+			if (IS_ERR(psizes))
+				return PTR_ERR(psizes);
 		}
 
 		spin_lock_irqsave(&d->lock,flags);
