From: Amol Lad <amol@verismonetworks.com>
Date: Wed, 11 Oct 2006 13:08:12 +0000
Subject: [KJ] [PATCH] drivers/usb/core/message.c: Replacing yield() with
Message-Id: <1160571372.19143.325.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux kernel <linux-kernel@vger.kernel.org>
Cc: kernel Janitors <kernel-janitors@lists.osdl.org>

In 2.6, the semantics of calling yield() changed from "sleep for a
bit" to "I really don't want to run for a while".  This matches POSIX
better, but there's a lot of drivers still using yield() when they mean
cond_resched(), schedule() or even schedule_timeout().

For this driver cond_resched() seems to be a better
alternative

Tested compile only

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/usb/core/message.c linux-2.6.19-rc1/drivers/usb/core/message.c
--- linux-2.6.19-rc1-orig/drivers/usb/core/message.c	2006-10-05 14:00:52.000000000 +0530
+++ linux-2.6.19-rc1/drivers/usb/core/message.c	2006-10-11 17:57:02.000000000 +0530
@@ -502,7 +502,7 @@ void usb_sg_wait (struct usb_sg_request 
 			io->urbs[i]->dev = NULL;
 			retval = 0;
 			i--;
-			yield ();
+			cond_resched();
 			break;
 
 			/* no error? continue immediately.


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
