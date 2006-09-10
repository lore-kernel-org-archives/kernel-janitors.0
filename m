From: David Farning <dfarning@gmail.com>
Date: Sun, 10 Sep 2006 19:16:17 +0000
Subject: [KJ]  [Patch] compile warning cleanup drivers/char/
Message-Id: <1157915777.4607.17.camel@dfarning-desktop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

warning:this is my first submission to kj.

This quiets a compile warning in drivers/char

Signed-off-by: David Farning <dfarning@gmail.com>

diff --git a/drivers/char/tty_io.c b/drivers/char/tty_io.c
index bb0d919..dcf790c 100644
--- a/drivers/char/tty_io.c
+++ b/drivers/char/tty_io.c
@@ -2455,7 +2455,7 @@ #endif
 
 static int tty_open(struct inode * inode, struct file * filp)
 {
-	struct tty_struct *tty;
+	struct tty_struct *tty = NULL;
 	int noctty, retval;
 	struct tty_driver *driver;
 	int index;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
