From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:09:54 +0000
Subject: [Kernel-janitors] [PATCH] drivers/char/selection.c MIN/MAX removal
Message-Id: <40E81A4B.3090607@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020406060805000202070706"
List-Id: <kernel-janitors.vger.kernel.org>
References: <40E81A6A.5060904@gmx.net>
In-Reply-To: <40E81A6A.5060904@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------020406060805000202070706
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------020406060805000202070706
Content-Type: text/plain;
 name="patch-char-selection"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-char-selection"

--- linux-2.6.7-old/drivers/char/selection.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.7-new/drivers/char/selection.c	2004-07-04 15:46:04.050289920 +0200
@@ -26,10 +26,6 @@
 #include <linux/tiocl.h>
 #include <linux/console.h>
 
-#ifndef MIN
-#define MIN(a,b)	((a) < (b) ? (a) : (b))
-#endif
-
 /* Don't take this from <ctype.h>: 011-015 on the screen aren't spaces */
 #define isspace(c)	((c) == ' ')
 
@@ -295,7 +291,7 @@
 			continue;
 		}
 		count = sel_buffer_lth - pasted;
-		count = MIN(count, tty->ldisc.receive_room(tty));
+		count = min(count, tty->ldisc.receive_room(tty));
 		tty->ldisc.receive_buf(tty, sel_buffer + pasted, 0, count);
 		pasted += count;
 	}

--------------020406060805000202070706
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------020406060805000202070706--
