From: "Suresh Jayaraman" <sjayaraman@novell.com>
Date: Thu, 28 Jun 2007 16:51:26 +0000
Subject: [KJ] [PATCH] char: Remove unnecessary cast of return value of
Message-Id: <46843466020000F40000A9AA@lucius.provo.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove unnecessary cast of return value of kmalloc() in char/tty_io.c

Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
---

diff --git a/drivers/char/tty_io.c b/drivers/char/tty_io.c
index a96f26a..914558f 100644
--- a/drivers/char/tty_io.c
+++ b/drivers/char/tty_io.c
@@ -2008,16 +2008,14 @@ static int init_dev(struct tty_driver *driver, int idx,
 	}
 
 	if (!*tp_loc) {
-		tp = (struct ktermios *) kmalloc(sizeof(struct ktermios),
-						GFP_KERNEL);
+		tp = kmalloc(sizeof(struct ktermios), GFP_KERNEL);
 		if (!tp)
 			goto free_mem_out;
 		*tp = driver->init_termios;
 	}
 
 	if (!*ltp_loc) {
-		ltp = (struct ktermios *) kmalloc(sizeof(struct ktermios),
-						 GFP_KERNEL);
+		ltp = kmalloc(sizeof(struct ktermios), GFP_KERNEL);
 		if (!ltp)
 			goto free_mem_out;
 		memset(ltp, 0, sizeof(struct ktermios));
@@ -2041,16 +2039,14 @@ static int init_dev(struct tty_driver *driver, int idx,
 		}
 
 		if (!*o_tp_loc) {
-			o_tp = (struct ktermios *)
-				kmalloc(sizeof(struct ktermios), GFP_KERNEL);
+			o_tp = kmalloc(sizeof(struct ktermios), GFP_KERNEL);
 			if (!o_tp)
 				goto free_mem_out;
 			*o_tp = driver->other->init_termios;
 		}
 
 		if (!*o_ltp_loc) {
-			o_ltp = (struct ktermios *)
-				kmalloc(sizeof(struct ktermios), GFP_KERNEL);
+			o_ltp = kmalloc(sizeof(struct ktermios), GFP_KERNEL);
 			if (!o_ltp)
 				goto free_mem_out;
 			memset(o_ltp, 0, sizeof(struct ktermios));

-- 
Suresh Jayaraman


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
