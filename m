From: Domen Puncer <domen@coderock.org>
Date: Fri, 16 Jan 2004 17:53:17 +0000
Subject: [Kernel-janitors] [patch 2.6.1] double put_user in
Message-Id: <200401161853.17715.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi.

Trivial, this patch was a bit wrong:
http://linux.bkbits.net:8080/linux-2.5/diffs/drivers/s390/net/ctctty.c@1.20

Also "if (error)" is not really needed; put_user returns 0 on success.


--- c/drivers/s390/net/ctctty.c	2003-12-18 03:58:56.000000000 +0100
+++ a/drivers/s390/net/ctctty.c	2004-01-16 18:47:34.000000000 +0100
@@ -759,10 +759,7 @@ ctc_tty_ioctl(struct tty_struct *tty, st
 			       info->line);
 #endif
 			error = put_user(C_CLOCAL(tty) ? 1 : 0, (ulong *) arg);
-			if (error)
-				return error;
-			put_user(C_CLOCAL(tty) ? 1 : 0, (ulong *) arg);
-			return 0;
+			return error;
 		case TIOCSSOFTCAR:
 #ifdef CTC_DEBUG_MODEM_IOCTL
 			printk(KERN_DEBUG "%s%d ioctl TIOCSSOFTCAR\n", CTC_TTY_NAME,

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
