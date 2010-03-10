From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Mar 2010 21:17:28 +0000
Subject: [PATCH 6/6] drivers/char/ppdev.c: Use kasprintf
Message-Id: <Pine.LNX.4.64.1003102216510.1672@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

kasprintf combines kmalloc and sprintf, and takes care of the size
calculation itself.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression a,flag;
expression list args;
statement S;
@@

  a -  \(kmalloc\|kzalloc\)(...,flag)
+  kasprintf(flag,args)
  <... when != a
  if (a = NULL || ...) S
  ...>
- sprintf(a,args);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/char/ppdev.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff -u -p a/drivers/char/ppdev.c b/drivers/char/ppdev.c
--- a/drivers/char/ppdev.c
+++ b/drivers/char/ppdev.c
@@ -286,12 +286,10 @@ static int register_device (int minor, s
 	char *name;
 	int fl;
 
-	name = kmalloc (strlen (CHRDEV) + 3, GFP_KERNEL);
+	name = kasprintf(GFP_KERNEL, CHRDEV "%x", minor);
 	if (name = NULL)
 		return -ENOMEM;
 
-	sprintf (name, CHRDEV "%x", minor);
-
 	port = parport_find_number (minor);
 	if (!port) {
 		printk (KERN_WARNING "%s: no associated port!\n", name);
