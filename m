From: Domen Puncer <domen@coderock.org>
Date: Sat, 17 Jan 2004 14:11:35 +0000
Subject: [Kernel-janitors] [patch 2.6.1] remove verify_area from
Message-Id: <200401171511.35587.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi.

Pretty trivial.


--- c/drivers/char/dz.c	2003-12-18 03:58:08.000000000 +0100
+++ a/drivers/char/dz.c	2004-01-17 15:08:53.000000000 +0100
@@ -986,11 +986,7 @@ static int dz_ioctl(struct tty_struct *t
 		return 0;
 
 	case TIOCGSOFTCAR:
-		error = verify_area (VERIFY_WRITE, (void *)arg, sizeof(long));
-		if (error)
-			return error;
-		put_user(C_CLOCAL(tty) ? 1 : 0, (unsigned long *)arg);
-		return 0;
+		return put_user(C_CLOCAL(tty) ? 1 : 0, (unsigned long *)arg);
 
 	case TIOCSSOFTCAR:
 		if (get_user (arg, (unsigned long *)arg))
@@ -1001,10 +997,6 @@ static int dz_ioctl(struct tty_struct *t
 		return 0;
 
 	case TIOCGSERIAL:
-		error = verify_area(VERIFY_WRITE, (void *)arg,
-		                    sizeof(struct serial_struct));
-		if (error)
-			return error;
 		return get_serial_info(info, (struct serial_struct *)arg);
 
 	case TIOCSSERIAL:

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
